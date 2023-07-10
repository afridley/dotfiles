```js
const AWS = require('aws-sdk');

const CognitoUserPool = require('amazon-cognito-identity-js-node').CognitoUserPool;

const CognitoUserSession = require('amazon-cognito-identity-js-node').CognitoUserSession;

const CognitoUser = require('amazon-cognito-identity-js-node').CognitoUser;

const CognitoIdToken = require('amazon-cognito-identity-js-node').CognitoIdToken;

const CognitoAccessToken = require('amazon-cognito-identity-js-node').CognitoAccessToken;

const CognitoRefreshToken = require('amazon-cognito-identity-js-node').CognitoRefreshToken;

const cfg = require('config').config;

const COGNITO_IDENTITY_POOL_ID = cfg.COGNITO_IDENTITY_POOL_ID;

const COGNITO_USER_POOL_ID = cfg.COGNITO_USER_POOL_ID;

const COGNITO_CLIENT_ID = cfg.COGNITO_CLIENT_ID;

const AWS_API_GATEWAY_HOSTNAME = cfg.AWS_API_GATEWAY_HOSTNAME;

const AWS_REGION = cfg.AWS_REGION;

// Redirect to "/login" if a user is not logged-in.

exports.authorize = require('connect-ensure-login').ensureLoggedIn('/login');

exports.authorizeUser = function(req, res, next) {

AWS.config.region = AWS_REGION;

const tokens = req.user.tokens;

AWS.config.credentials = getCognitoIdentityCredentials(tokens);

AWS.config.credentials.get(function(err) {

if (err) throw err;

req.session.identityId = AWS.config.credentials.identityId;

const credentials = AWS.config.credentials.data.Credentials;

req.session.AWSCredentials = getAWSCredentials(credentials);

next();

});

};

exports.checkTokenExpiration = function(req, res, next) {

const AccessToken = new CognitoAccessToken({AccessToken: req.user.tokens.accessToken});

const IdToken = new CognitoIdToken({IdToken: req.user.tokens.idToken});

const RefreshToken = new CognitoRefreshToken({RefreshToken: req.user.tokens.refreshToken});

const sessionData = {

IdToken: IdToken,

AccessToken: AccessToken,

RefreshToken: RefreshToken

};

const cachedSession = new CognitoUserSession(sessionData);

if (cachedSession.isValid()) {

next();

} else {

cognitoUser = getCognitoUser(req);

cognitoUser.refreshSession(RefreshToken, (err, session) => {

if (err) throw err;

const tokens = getTokens(session);

AWS.config.credentials = getCognitoIdentityCredentials(tokens);

AWS.config.credentials.get(function() {

const credentials = AWS.config.credentials.data.Credentials;

req.session.AWSCredentials = getAWSCredentials(credentials);

next();

});

});

}

};

getCognitoUser = function(req) {

const poolData = {

UserPoolId : COGNITO_USER_POOL_ID,

ClientId : COGNITO_CLIENT_ID

};

const userPool = new CognitoUserPool(poolData);

const userData = {

Username : req.user.email,

Pool : userPool

};

return new CognitoUser(userData);

};

getTokens = function(session) {

return {

accessToken: session.getAccessToken().getJwtToken(),

idToken: session.getIdToken().getJwtToken(),

refreshToken: session.getRefreshToken().getToken()

};

};

getCognitoIdentityCredentials = function(tokens) {

const loginInfo = {};

loginInfo[`cognito-idp.${AWS_REGION}.amazonaws.com/${COGNITO_USER_POOL_ID}`] = tokens.idToken;

const params = {

IdentityPoolId: COGNITO_IDENTITY_POOL_ID,

Logins: loginInfo

};

return new AWS.CognitoIdentityCredentials(params);

};

getAWSCredentials = function(credentials) {

return {

accessKey: credentials.AccessKeyId,

secretKey: credentials.SecretKey,

sessionToken: credentials.SessionToken,

region: AWS_REGION,

invokeUrl: 'https://' + AWS_API_GATEWAY_HOSTNAME

};

};
```