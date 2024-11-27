```
image:
  name: atlassian/default-image:4

options:
  size: 2x

definitions:
  # =======================================================
  # UI SSO NPM Setup
  # =======================================================
  caches:
    npm:
      path: $HOME/.npm
      key:
        files:
          - ui/package-lock.json
    node:
      path: ui/node_modules
      key:
        files:
          - ui/package-lock.json
  steps:
    # =======================================================
    # Environment Setup
    # =======================================================
    - step: &authenticate-env
        name: Authenticate and Env
        image: public.ecr.aws/aws-cli/aws-cli:2.17.14
        oidc: true
        script:
          - >-
            echo export BUCKET_NAME_SSO_UI=$BUCKET_NAME_SSO_UI | tee -a .env &&
            echo export CLOUDFRONT_DISTRIBUTION_ID_SSO_UI=$CLOUDFRONT_DISTRIBUTION_ID_SSO_UI | tee -a .env &&
            echo export VITE_USER_POOL_ID=$VITE_USER_POOL_ID | tee -a .env &&
            echo export VITE_CLIENT_ID=$VITE_CLIENT_ID | tee -a .env &&
            echo export VITE_OAUTH_DOMAIN=$VITE_OAUTH_DOMAIN | tee -a .env &&
            echo export VITE_COOKIE_DOMAIN=$VITE_COOKIE_DOMAIN | tee -a .env &&
            echo export VITE_REDIRECT_SIGN_IN=$VITE_REDIRECT_SIGN_IN | tee -a .env &&
            echo export VITE_REDIRECT_SIGN_OUT=$VITE_REDIRECT_SIGN_OUT | tee -a .env &&
            echo export VITE_SST_ACCESS_TOKEN=$VITE_SST_ACCESS_TOKEN | tee -a .env &&
            echo export LAUNCHDARKLY_SDK_KEY=$LAUNCHDARKLY_SDK_KEY | tee -a .env &&
            echo export VITE_LD_CLIENT_ID=$VITE_LD_CLIENT_ID | tee -a .env &&
            echo export VITE_SST_BASE=$VITE_SST_BASE | tee -a .env &&
            echo export VITE_GA_LOGGING=$VITE_GA_LOGGING | tee -a .env &&
            echo export VITE_GTM_ID=$VITE_GTM_ID | tee -a .env &&
            echo export VITE_REGION=$VITE_REGION | tee -a .env &&
            echo export VITE_DATA_LAYER=$VITE_DATA_LAYER | tee -a .env &&

            echo export ECR_REPO=$AWS_ACCOUNT.dkr.ecr.us-east-1.amazonaws.com | tee -a .env &&
            BRANCH_COM="$BITBUCKET_BRANCH-$BITBUCKET_COMMIT" && echo export ECR_TAG=$(echo "${BRANCH_COM//\//-}") | tee -a .env &&
            echo export FULL_ENV=$TF_VAR_environment | tee -a .env &&
            echo export TF_WORKSPACE=$TF_WORKSPACE | tee -a .env &&
            echo export TF_VAR_environment=$TF_VAR_environment | tee -a .env &&
            echo export AWS_ACCOUNT=$AWS_ACCOUNT | tee -a .env &&
            echo export AWS_ROLE_ARN=arn:aws:iam::$AWS_ACCOUNT:role/bitbucket-agent-role | tee -a .env &&
            echo export AWS_WEB_IDENTITY_TOKEN_FILE=$(pwd)/web-identity-token | tee -a .env &&
            echo $BITBUCKET_STEP_OIDC_TOKEN > $(pwd)/web-identity-token
        artifacts:
          - .env
          - web-identity-token
    # =======================================================
    # ECR Image Build
    # =======================================================
    - step: &esp_snowflake_firehose_lambda_build
        name: Build and Publish Custom Firehose Processing Lambda Image
        image: public.ecr.aws/aws-cli/aws-cli:2.17.14
        caches:
          - docker
        services:
          - docker
        condition:
          changesets:
            includePaths:
              # Only build if there are code changes for the function
              - services/user_data_stream/**
        script:
          - source .env
          - export REPO_NAME="esp/snowflake-user-data-$FULL_ENV"
          - aws ecr describe-repositories --repository-names ${REPO_NAME} || aws ecr create-repository --repository-name ${REPO_NAME} --encryption-configuration encryptionType=AES256 --image-scanning-configuration scanOnPush=true
          - export IMAGE_URI="$ECR_REPO/$REPO_NAME:$ECR_TAG"
          - export FUNCTION_SRC_PATH=services/user_data_stream
          - aws ecr get-login-password | docker login --username AWS --password-stdin $ECR_REPO
          - docker build -f $FUNCTION_SRC_PATH/Dockerfile -t $IMAGE_URI $FUNCTION_SRC_PATH
          - docker push $IMAGE_URI
    - step: &esp_sso_ansira_token_cache_lambda_build
        name: Build and Publish ESP SSO Ansira Token Cache Lambda Image
        image: public.ecr.aws/aws-cli/aws-cli:2.17.14
        caches:
          - docker
        services:
          - docker
        condition:
          changesets:
            includePaths:
              # Only build if there are code changes for the function
              - services/ansira_token_cache/**
              - services/libs/powertools.py
        script:
          - source .env
          - yum install make -y
          - export REPO_NAME="esp/ansira-token-cache-$FULL_ENV"
          - aws ecr describe-repositories --repository-names ${REPO_NAME} || aws ecr create-repository --repository-name ${REPO_NAME} --encryption-configuration encryptionType=AES256 --image-scanning-configuration scanOnPush=true
          - export IMAGE_URI="$ECR_REPO/$REPO_NAME:$ECR_TAG"
          - export FUNCTION_SRC_PATH=services/ansira_token_cache
          - cd $FUNCTION_SRC_PATH && pwd
          - make libs
          - cd - && pwd
          - aws ecr get-login-password | docker login --username AWS --password-stdin $ECR_REPO
          - docker build -f $FUNCTION_SRC_PATH/Dockerfile -t $IMAGE_URI $FUNCTION_SRC_PATH
          - docker push $IMAGE_URI
    - step: &esp_sso_custom_sms_sender_lambda_build
        name: Build and Publish Custom SMS Sender Lambda Image
        image: public.ecr.aws/aws-cli/aws-cli:2.17.14
        caches:
          - docker
        services:
          - docker
        condition:
          changesets:
            includePaths:
              # Only build if there are code changes for the function
              - services/custom_sms_sender/**
              - services/libs/powertools.py
        script:
          - source .env
          - yum install make -y
          - export REPO_NAME="esp/custom-sms-sender-$FULL_ENV"
          - aws ecr describe-repositories --repository-names ${REPO_NAME} || aws ecr create-repository --repository-name ${REPO_NAME} --encryption-configuration encryptionType=AES256 --image-scanning-configuration scanOnPush=true
          - export IMAGE_URI="$ECR_REPO/$REPO_NAME:$ECR_TAG"
          - export FUNCTION_SRC_PATH=services/custom_sms_sender
          - cd $FUNCTION_SRC_PATH && pwd
          - make libs
          - cd - && pwd
          - aws ecr get-login-password | docker login --username AWS --password-stdin $ECR_REPO
          - docker build -f $FUNCTION_SRC_PATH/Dockerfile -t $IMAGE_URI $FUNCTION_SRC_PATH
          - docker push $IMAGE_URI
    # =======================================================
    # ECR Image Scan
    # =======================================================
    - step: &esp_sso_ansira_token_cache_lambda_scan
        name: Check ESP SSO Ansira Token Cache Lambda Image scan for vulnerabilities
        image:
          name: 637761279150.dkr.ecr.us-east-1.amazonaws.com/esp/container-scanning:latest
          aws:
            oidc-role: arn:aws:iam::385859299497:role/bitbucket-agent-role
        oidc: true
        condition:
          changesets:
            includePaths:
              # Only build if there are code changes for the function
              - services/ansira_token_cache/**
              - services/libs/powertools.py
        script:
          - source .env
          - cd /
          - python3 main.py --repository-name esp/ansira-token-cache-$FULL_ENV --image-tag $ECR_TAG
    - step: &esp_sso_custom_sms_sender_lambda_scan
        name: Check ESP SSO Custom SMS Sender Lambda Image for vulnerabilities
        image:
          name: 637761279150.dkr.ecr.us-east-1.amazonaws.com/esp/container-scanning:latest
          aws:
            oidc-role: arn:aws:iam::385859299497:role/bitbucket-agent-role
        oidc: true
        condition:
          changesets:
            includePaths:
              # Only build if there are code changes for the function
              - services/custom_sms_sender/**
              - services/libs/powertools.py
        script:
          - source .env
          - cd /
          - python3 main.py --repository-name esp/custom-sms-sender-$FULL_ENV --image-tag $ECR_TAG
    # =======================================================
    # Ansira Token Cache Image Unit Tests Step
    # =======================================================
    - step: &run_unit_test_ansira
        name: Run Ansira Token Cache Unit Tests
        image: public.ecr.aws/lambda/python:3.12
        condition:
          changesets:
            includePaths:
              # Only build if there are code changes for the function
              - services/ansira_token_cache/**
              - services/libs/powertools.py
        script:
          - dnf update -y && dnf install make -y
          - cd services/ansira_token_cache
          - pip3 install poetry==1.8.2
          - poetry config virtualenvs.create false
          - poetry install
          - make test
    # =======================================================
    # Lambda Zip Dependencies
    # =======================================================
    - step: &install-python-dependencies
        name: Install Python Dependencies
        image: public.ecr.aws/lambda/python:3.12
        script:
          - dnf update -y && dnf install -y findutils
          - cd ./services
          - find . -maxdepth 1 -type d \( ! -name . ! -name ansira_token_cache ! -name custom_sms_sender ! -name ecr_scan_monitor ! -name libs ! -name mock_data ! -name PostConfirmation ! -name PreSignUp ! -name PreTokenGeneration ! -name source_codes ! -name user_migration \) -exec bash -c "echo '{}' && cd '{}' && cp -av ../{ansira.py,capillary.py,cognito.py,universal_pets.py} ./ && pip install -r requirements.txt -t ./" \;
          - find . -maxdepth 1 -type d \( -name PreSignUp -o -name PreTokenGeneration \) -exec bash -c "echo '{}' && cd '{}' && cp -av ../libs ./ && pip install -r requirements.txt -t ./" \;
          - find . -maxdepth 1 -type d \( -name user_migration \) -exec bash -c "echo '{}' && cd '{}' && pip install -r requirements.txt -t ./" \;
        caches:
          - pip
        artifacts:
          - services/**
    # =======================================================
    # Lambda Zip Unit Tests
    # =======================================================
    - step: &run_unit_test
        name: Run Unit Tests
        condition:
          changesets:
            includePaths:
              # Only run if there are code changes to lambda code
              - services/libs/**
              - services/PreSignUp/**
              - services/PreTokenGeneration/**
        image: public.ecr.aws/lambda/python:3.12
        script:
          - dnf update -y && dnf install -y findutils
          - service_dir="$(pwd)/services"
          - cd "${service_dir}"/PreSignUp && pwd && ./pipeline-test.sh
          - cd "${service_dir}"/PreTokenGeneration && pwd && ./pipeline-test.sh
    # =======================================================
    # UI SSO Setup
    # =======================================================
    - step: &build-ui
        name: Build React UI
        script:
          - source .env
          - cd ui
          - npm install
          - npm run build
        caches:
          - npm
          - node
        artifacts:
          - ui/dist/**
    - step: &deploy-ui
        name: Deploy React UI
        image: public.ecr.aws/aws-cli/aws-cli:2.17.14
        script:
          - source .env
          - cd ui
          - aws s3 cp dist s3://$BUCKET_NAME_SSO_UI --recursive
          - aws cloudfront create-invalidation --distribution-id $CLOUDFRONT_DISTRIBUTION_ID_SSO_UI --paths "/*"
    # =======================================================
    # Terraform Actions
    # =======================================================
    - step: &plan
        name: Terraform Plan
        image: public.ecr.aws/hashicorp/terraform:1.9.8
        script:
          - source .env
          - cd terraform
          - terraform init
          - terraform plan -out out.tfplan
        artifacts:
          - terraform/.terraform/**
          - terraform/.terraform.lock.hcl
          - terraform/out.tfplan
          - terraform/*.zip
    - step: &apply
        name: Terraform Apply
        image: public.ecr.aws/hashicorp/terraform:1.9.8
        size: 2x
        trigger: manual
        script:
          - source .env
          - cd terraform
          - terraform apply out.tfplan
    - step: &destroy-plan
        name: Terraform Plan Destroy
        image: public.ecr.aws/hashicorp/terraform:1.9.8
        trigger: manual
        script:
          - source .env
          - cd terraform
          - terraform plan -destroy -out destroy.tfplan
        artifacts:
          - terraform/destroy.tfplan
    - step: &destroy
        name: Terraform Apply Destroy
        image: public.ecr.aws/hashicorp/terraform:1.9.8
        trigger: manual
        script:
          - source .env
          - cd terraform
          - terraform apply destroy.tfplan

pipelines:
  default:
    - step:
        <<: *authenticate-env
        deployment: Development
    - parallel:
        steps:
          - step: *build-ui
          - step: *install-python-dependencies
    - step: *plan
  pull-requests:
    '**':
      - step: *run_unit_test
      - step: *run_unit_test_ansira
  branches:
    dev:
      - step:
          <<: *authenticate-env
          deployment: Development
      - parallel:
          steps:
            - step: *build-ui
            - step: *install-python-dependencies
            - step: *esp_snowflake_firehose_lambda_build
            - step: *esp_sso_ansira_token_cache_lambda_build
            - step: *esp_sso_custom_sms_sender_lambda_build
      - step: *plan
      - step: *apply
      - step: *deploy-ui
    qa:
      - step:
          <<: *authenticate-env
          deployment: Staging
      - parallel:
          steps:
            - step: *install-python-dependencies
            - step: *esp_snowflake_firehose_lambda_build
            - step: *esp_sso_ansira_token_cache_lambda_build
            - step: *esp_sso_custom_sms_sender_lambda_build
      - step: *plan
      - step: *apply
    main:
      - step:
          <<: *authenticate-env
          deployment: Production
      - parallel:
          steps:
            - step: *install-python-dependencies
            - step: *esp_snowflake_firehose_lambda_build
            - step: *esp_sso_ansira_token_cache_lambda_build
            - step: *esp_sso_custom_sms_sender_lambda_build
      - step: *plan
      - step: *apply
```