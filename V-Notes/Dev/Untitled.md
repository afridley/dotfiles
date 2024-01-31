export const PROFILE_CONFIG: Config = {
  cognito: {
    userPoolWebClientId: '3h2t0pbb0sc1viet8slbstlcob',
    userPoolId: 'us-east-1_i7TVeIXex',
    region: 'us-east-1',
    oauth: {
      domain: 'login-dev.purina.com',
      redirectSignOut: 'https://poc-pup-module-netlify--purinacom.netlify.app/',
      redirectSignIn: 'https://poc-pup-module-netlify--purinacom.netlify.app/',
      // redirectSignOut: 'http://localhost:3001/',
      // redirectSignIn: 'http://localhost:3001/',
    },
  },
  pup: {
    dataLayerName: 'purData',
    property: 'purina',
    url: 'https://develop.du885f16te1yv.amplifyapp.com',
    // url: 'http://localhost:3000',
  },
};
