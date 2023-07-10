# Amazon Cognito User Pools in NodeJS as fast as possible.

[

![Prasad Jayashanka](https://miro.medium.com/v2/resize:fill:88:88/1*K0SjhCnGe8ejbHhr-YnGXQ.jpeg)









](https://medium.com/@prasadjay?source=post_page-----22d586c5c8ec--------------------------------)

[Prasad Jayashanka](https://medium.com/@prasadjay?source=post_page-----22d586c5c8ec--------------------------------)

·

Follow

5 min read

·

Jun 5, 2018

1.7K

21

[

](https://medium.com/plans?dimension=post_audio_button&postId=22d586c5c8ec&source=upgrade_membership---post_audio_button----------------------------------)

Amazon cognito simplifies the authentication, authorization and user management for you. It has apis for sign in, sign up and miscellaneous user management apis built in and based on Oauth2 specification. Best thing about is it supports all major web platforms and mobile. SDKs are available for Obj-C, java and Swift as well.

![](https://miro.medium.com/v2/resize:fit:460/1*NTVIKDh8_tmdinB8pBJzhA.jpeg)

When it comes to Cognito there are two main attractions. And those two are there to do server different purposes.

1.  User pools
2.  Identity pools

**User pools** is an identity provider. You can use this to authenticate users to your mobile app, website and manage users.

**Identity pools** are used to authorize users to give access to your aws resources such as IAM, S3 and etc. That means you can configure an identity pool with many identity providers such as Amazon , Facebook, twitter and also user pools to give access to outside users without any kind of registration. Pretty neat.

![](https://miro.medium.com/v2/resize:fit:1400/1*6TeBm2nxup6YeDm7axm_uA.png)

The scope of this story is to cover up accessing user pools via nodejs. Managing identity pools will be covered in another story. We will be using the JavaScript package and using it in NodeJS.

**Setting up User Pools**

First login to your aws account and go to cognito section. If you don’t have an aws account yet, create a free account which will be free for an year. Then go to Cognito section and then create a user pool.

1.  Give a name for the pool.

![](https://miro.medium.com/v2/resize:fit:1400/1*cbq_C7oDDrAyc2ioMjF4vQ.jpeg)

2. Select how you want to authenticate users using either email, phone or both.

![](https://miro.medium.com/v2/resize:fit:1400/1*6F46R9wSV5YpLvFHRRXtHQ.jpeg)

3. When a user is successfully authenticated, you will receive 3 tokens. An id token, access token and a refresh token. The attributes you specify here will be mentioned in id token claims. You can use this claims as data in your services if you desire.

![](https://miro.medium.com/v2/resize:fit:1400/1*mKyM60RZcO_3Qd-SMTBYHQ.jpeg)

4. Define password and signup criteria.

![](https://miro.medium.com/v2/resize:fit:1400/1*lHDvqP3n0qrX-avJM4zFOA.jpeg)

5. Define multi factor authentication settings. I’m just going to leave it disabled for demo.

![](https://miro.medium.com/v2/resize:fit:1400/1*sssMVkIcZ8oiB9wiwnth3g.jpeg)

6. If you want you can customize your email messages. So when a user sign ups he will get an email to confirm his account. You can customize that message in this screen.

![](https://miro.medium.com/v2/resize:fit:1400/1*6QzMbToeXYiz2bbYB2wOrQ.jpeg)

![](https://miro.medium.com/v2/resize:fit:1400/1*5wa8rujAtFd3rX89IZzTXA.jpeg)

7. Add any tags you want to pool.

![](https://miro.medium.com/v2/resize:fit:1032/1*DcOWr44mHhX10kYiycXNKw.jpeg)

8. Define if remember user devices or not.

![](https://miro.medium.com/v2/resize:fit:1116/1*D_sS6QPji658Yf_aIp25Rg.jpeg)

9. In here you have to click on “Add an app client” and create the app client. The app client generates an app client Id and it’s needed to access the pool from code.

![](https://miro.medium.com/v2/resize:fit:1400/1*ZOP7nyMEuEWyfOdnjTBVVA.jpeg)

EDIT : You should un-check the “Generate client secret”option since Javascript SDK doesn’t support client secret. Thanks to Alain who pointed out the error which I’ve missed.

![](https://miro.medium.com/v2/resize:fit:1400/1*q9pFgfcP27XXWIg7V7kEUQ.jpeg)

10. If you want to execute any defined lambda functions at certain point of auth flow, you can specify those here. If not just skip it.

![](https://miro.medium.com/v2/resize:fit:1400/1*HCCH-AF7D1VHLAJOWKsc-g.jpeg)

11. Finally review settings and create the pool.

![](https://miro.medium.com/v2/resize:fit:1400/1*08XpuODeWdiizuWtkS0YpQ.jpeg)

That’s about it. Now note down the pool region, pool id and app client id. When you click on created pool overview section you can retrieve pool id, if you go to app clients, you can retrieve the app client id. You are going to need those for next steps.

First install must needed packages.

npm install --save amazon-cognito-identity-js  
npm install --save aws-sdk  
npm install --save request  
npm install --save jwk-to-pem  
npm install --save jsonwebtoken  
npm install --save node-fetch

Then import all packages.

const AmazonCognitoIdentity = require('amazon-cognito-identity-js');  
const CognitoUserPool = AmazonCognitoIdentity.CognitoUserPool;  
const AWS = require('aws-sdk');  
const request = require('request');  
const jwkToPem = require('jwk-to-pem');  
const jwt = require('jsonwebtoken');  
global.fetch = require('node-fetch');

Reason for importding node-fetch to global.fetch is because of amazon-cognito-identity-js package. It’s a javascript library meant for web browser and it uses fetch in library. Since nodejs don’t have fetch in built we have to emulate it like that.

Then define pool info.

const poolData = {      
UserPoolId : "", // Your user pool id here      
ClientId : "" // Your client id here  
}; const pool_region = 'us-east-1';

Initiate user pool.

const userPool = new AmazonCognitoIdentity.CognitoUserPool(poolData);

Register User

Login

Update user data

Validate/verify JWT token

Renew JWT tokens via refresh token. Usually id tokens retire after 1 hour of time, which is a hard limit for cognito. Using the refresh you obtained earlier you can get a new id_token, access_token with this rather than logging in again.

Delete User

Delete attributes

Change Password

There are lot of other tasks, but since the scope is to cover the most basic ones, this is it for now. On to Identity pools in the next story. :)