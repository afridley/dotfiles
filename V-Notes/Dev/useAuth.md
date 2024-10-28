```ts
export const useAuthEx = () => {
  const [user, setUser] = useState<User | null>(null);
  const [isLoading, setIsLoading] = useState(true);
  const [error, setError] = useState<Error | null>(null);

  useEffect(() => {
    profileAuth(PROFILE_CONFIG)
      .getSession()
      .then(session => {
        const userSession = session.idTokenAttributes as CognitoIdAttributes;
        setUser({
          ansiraId: userSession['custom:ansiraId'],
          email: userSession.email,
          emailVerified: userSession.email_verified,
          lastName: userSession.family_name,
          name: userSession.given_name,
          fullName: userSession.name,
          ansiraUuid: userSession['custom:ansiraUuid'],
        });
        setIsLoading(false);
      })
      .catch(err => {
        setError(err);
        setIsLoading(false);
      });
  }, []);

  return { user, isLoading, error };
};

```