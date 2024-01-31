inspect serverside
```
console.log(require('util').inspect(theObject, { showHidden: false, depth: null, colors: true }))
```

```
export const updateUserPassword = async (ansiraId: string, { currentPW, newPW, sourceCode }: UpdatePasswordPayload) => {
  console.log({ ansiraId }, { currentPW }, { newPW }, { sourceCode })
  const res = await sstService.updateUserPasswordSstServicesV1UsersUserIdPasswordPost(ansiraId, { currentPW, newPW, sourceCode })
  console.log({ res })
  return res
}

```

```
      const user = await Auth.currentSession()
      const idToken = user.getIdToken().payload as ICognitoIDUser
      console.log('trying')
      // await Auth.changePassword(user, data.currentPassword, data.password)
      const c = await updateUserPassword(
        idToken.ansiraId,
        { currentPW: data.currentPassword, newPW: data.password, sourceCode: getSourceCode(SOURCE_CODES.ADD_PET) },
      )
      console.log({ c })

      toast({
        children: 'Password has been successfully changed',
        status: 'success',
        duration: 10000,
      })

```