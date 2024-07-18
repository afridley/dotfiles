import { profileAuth } from '@purinanbm/pup-script';
import { useQuery } from '@tanstack/react-query';

import { PROFILE_CONFIG } from 'src/common/constants';

type CognitoIdAttributes = {
  at_hash: string;
  sub: string;
  email_verified: boolean;
  iss: string;
  phone_number_verified: boolean;
  'custom:tAndC': string;
  'cognito:username': string;
  given_name: string;
  'custom:ansiraId': string;
  origin_jti: string;
  'custom:purinaAdsOptIn': string;
  'custom:ansiraUuid': string;
  aud: string;
  token_use: string;
  auth_time: number;
  name: string;
  exp: number;
  iat: number;
  family_name: string;
  jti: string;
  email: string;
};

type User = {
  ansiraId: string;
  email: string;
  emailVerified: boolean;
  lastName: string;
  name: string;
  fullName: string;
  ansiraUuid: string;
};

export const useAuth = () => {
  const { data, ...query } = useQuery<User>({
    queryKey: ['getAuth'],
    queryFn: async () => {
      const session = await profileAuth(PROFILE_CONFIG).getSession();
      const user = session.idTokenAttributes as CognitoIdAttributes;

      return {
        ansiraId: user['custom:ansiraId'],
        email: user.email,
        emailVerified: user.email_verified,
        lastName: user.family_name,
        name: user.given_name,
        fullName: user.name,
        ansiraUuid: user['custom:ansiraUuid'],
      };
    },
    retry: false,
  });

  return { user: data, ...query };
};
