```
	"PurinaSite" = {
      callback_urls = flatten([
        // Prod Url
        ["https://purina.com/"],
        // Dev Urls
        var.environment == "dev" ? ["https://h20dev-pocpupmodule.gatsbyjs.io/", "http://localhost:3000/", "http://localhost:3001/", "https://dev-h20.purina.com/"] : []
      ])
      default_redirect_uri = null
      access_token_validity = {
        units    = "minutes"
        duration = 60
      }
      id_token_validity = {
        units    = "hours"
        duration = 1
      }
      refresh_token_validity = {
        units    = "days"
        duration = 30
      }
      auth_session_validity                         = 3
      allowed_oauth_flows_user_pool_client          = true
      allowed_oauth_flows                           = ["code"]
      allowed_oauth_scopes                          = ["phone", "profile", "email", "openid"]
      enable_token_revocation                       = true
      enable_propagate_additional_user_context_data = false
      explicit_auth_flows                           = ["ALLOW_REFRESH_TOKEN_AUTH", "ALLOW_USER_PASSWORD_AUTH", "ALLOW_USER_SRP_AUTH"]
      generate_secret                               = null
      logout_urls                                   = flatten([
        // Prod Url
        ["https://purina.com/"],
        // Dev Urls
        var.environment == "dev" ? ["https://h20dev-pocpupmodule.gatsbyjs.io/", "http://localhost:3000/", "http://localhost:3001/", "https://dev-h20.purina.com/"] : []
      ])
      prevent_user_existence_errors                 = null
      read_attributes = [
        "address",
        "birthdate",
        "custom:ansiraAddress1",
        "custom:ansiraAddress2",
        "custom:ansiraCity",
        "custom:ansiraCountry",
        "custom:ansiraId",
        "custom:ansiraPostalCode",
        "custom:ansiraPrimaryPhone",
        "custom:ansiraState",
        "custom:ansiraUuid",
        "custom:expiringPoints",
        "custom:externalId",
        "custom:lastEmail",
        "custom:lastExternalId",
        "custom:loyaltyPoints",
        "custom:loyaltyTAndC",
        "custom:purinaAdsOptIn",
        "custom:tAndC",
        "email",
        "email_verified",
        "family_name",
        "gender",
        "given_name",
        "locale",
        "middle_name",
        "name",
        "nickname",
        "phone_number",
        "phone_number_verified",
        "picture",
        "preferred_username",
        "profile",
        "updated_at",
        "website",
        "zoneinfo",
      ]
      write_attributes = [
        "address",
        "birthdate",
        "custom:ansiraAddress1",
        "custom:ansiraAddress2",
        "custom:ansiraCity",
        "custom:ansiraCountry",
        "custom:ansiraId",
        "custom:ansiraPostalCode",
        "custom:ansiraPrimaryPhone",
        "custom:ansiraState",
        "custom:ansiraUuid",
        "custom:expiringPoints",
        "custom:externalId",
        "custom:lastEmail",
        "custom:lastExternalId",
        "custom:loyaltyPoints",
        "custom:loyaltyTAndC",
        "custom:purinaAdsOptIn",
        "custom:tAndC",
        "email",
        "family_name",
        "gender",
        "given_name",
        "locale",
        "middle_name",
        "name",
        "nickname",
        "phone_number",
        "picture",
        "preferred_username",
        "profile",
        "updated_at",
        "website",
        "zoneinfo",
      ]
      supported_identity_providers = ["COGNITO"]
    }
    "UniversalLoginUI" = {
      callback_urls = flatten([
        // Prod Url
        ["https://login.purina.com/", "https://profile.purina.com/"],
        // Dev Urls
        var.environment == "dev" ? ["https://h20dev-pocpupmodule.gatsbyjs.io/", "http://localhost:3000/", "http://localhost:3001/", "https://dev-h20.purina.com/", "https://develop.d10za98y150x8s.amplifyapp.com/"] : []
      ])
      default_redirect_uri = null
      access_token_validity = {
        units    = "minutes"
        duration = 60
      }
      id_token_validity = {
        units    = "hours"
        duration = 1
      }
      refresh_token_validity = {
        units    = "days"
        duration = 30
      }
      auth_session_validity                         = 3
      allowed_oauth_flows_user_pool_client          = true
      allowed_oauth_flows                           = ["code"]
      allowed_oauth_scopes                          = ["phone", "profile", "email", "openid"]
      enable_token_revocation                       = true
      enable_propagate_additional_user_context_data = false
      explicit_auth_flows                           = ["ALLOW_REFRESH_TOKEN_AUTH", "ALLOW_USER_PASSWORD_AUTH", "ALLOW_USER_SRP_AUTH"]
      generate_secret                               = null
      logout_urls                                   = flatten([
        // Prod Url
        ["https://login.purina.com/", "https://profile.purina.com/"],
        // Dev Urls
        var.environment == "dev" ? ["https://h20dev-pocpupmodule.gatsbyjs.io/", "http://localhost:3000/", "http://localhost:3001/", "https://dev-h20.purina.com/", "https://develop.d10za98y150x8s.amplifyapp.com/"] : []
      ])
      prevent_user_existence_errors                 = null
      read_attributes = [
        "address",
        "birthdate",
        "custom:ansiraAddress1",
        "custom:ansiraAddress2",
        "custom:ansiraCity",
        "custom:ansiraCountry",
        "custom:ansiraId",
        "custom:ansiraPostalCode",
        "custom:ansiraPrimaryPhone",
        "custom:ansiraState",
        "custom:ansiraUuid",
        "custom:expiringPoints",
        "custom:externalId",
        "custom:lastEmail",
        "custom:lastExternalId",
        "custom:loyaltyPoints",
        "custom:loyaltyTAndC",
        "custom:purinaAdsOptIn",
        "custom:tAndC",
        "email",
        "email_verified",
        "family_name",
        "gender",
        "given_name",
        "locale",
        "middle_name",
        "name",
        "nickname",
        "phone_number",
        "phone_number_verified",
        "picture",
        "preferred_username",
        "profile",
        "updated_at",
        "website",
        "zoneinfo",
      ]
      write_attributes = [
        "address",
        "birthdate",
        "custom:ansiraAddress1",
        "custom:ansiraAddress2",
        "custom:ansiraCity",
        "custom:ansiraCountry",
        "custom:ansiraId",
        "custom:ansiraPostalCode",
        "custom:ansiraPrimaryPhone",
        "custom:ansiraState",
        "custom:ansiraUuid",
        "custom:expiringPoints",
        "custom:externalId",
        "custom:lastEmail",
        "custom:lastExternalId",
        "custom:loyaltyPoints",
        "custom:loyaltyTAndC",
        "custom:purinaAdsOptIn",
        "custom:tAndC",
        "email",
        "family_name",
        "gender",
        "given_name",
        "locale",
        "middle_name",
        "name",
        "nickname",
        "phone_number",
        "picture",
        "preferred_username",
        "profile",
        "updated_at",
        "website",
        "zoneinfo",
      ]
      supported_identity_providers = ["COGNITO"]
    }
```