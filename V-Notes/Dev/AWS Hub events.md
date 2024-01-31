
```ts
const listener = data => {
  switch (data?.payload?.event) {
    case 'configured':
      console.log('the Auth module is configured');
      break;
    case 'signIn':
      console.log('user signed in');
      break;
    case 'signIn_failure':
      console.log('user sign in failed');
      break;
    case 'signUp':
      console.log('user signed up');
      break;
    case 'signUp_failure':
      console.log('user sign up failed');
      break;
    case 'confirmSignUp':
      console.log('user confirmation successful');
      break;
    case 'completeNewPassword_failure':
      console.log('user did not complete new password flow');
      break;
    case 'autoSignIn':
      console.log('auto sign in successful');
      break;
    case 'autoSignIn_failure':
      console.log('auto sign in failed');
      break;
    case 'forgotPassword':
      console.log('password recovery initiated');
      break;
    case 'forgotPassword_failure':
      console.log('password recovery failed');
      break;
    case 'forgotPasswordSubmit':
      console.log('password confirmation successful');
      break;
    case 'forgotPasswordSubmit_failure':
      console.log('password confirmation failed');
      break;
    case 'verify':
      console.log('TOTP token verification successful');
      break;
    case 'tokenRefresh':
      console.log('token refresh succeeded');
      break;
    case 'tokenRefresh_failure':
      console.log('token refresh failed');
      break;
    case 'cognitoHostedUI':
      console.log('Cognito Hosted UI sign in successful');
      break;
    case 'cognitoHostedUI_failure':
      console.log('Cognito Hosted UI sign in failed');
      break;
    case 'customOAuthState':
      console.log('custom state returned from CognitoHosted UI');
      break;
    case 'customState_failure':
      console.log('custom state failure');
      break;
    case 'parsingCallbackUrl':
      console.log('Cognito Hosted UI OAuth url parsing initiated');
      break;
    case 'userDeleted':
      console.log('user deletion successful');
      break;
    case 'updateUserAttributes':
      console.log('user attributes update successful');
      break;
    case 'updateUserAttributes_failure':
      console.log('user attributes update failed');
      break;
    case 'signOut':
      console.log('user signed out');
      break;
    default:
      console.log('unknown event type');
      break;
  }
};

```