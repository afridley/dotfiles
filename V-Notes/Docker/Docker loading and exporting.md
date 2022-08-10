I wanted to add that the issue probably occurs because of the difference in behaviour of STDOUT between Windows and Unix. Therefore, using the STDOUT way of saving like:

`docker save [image] > file.tar` followed by `docker load < file.tar`

will not work if the `save` and `load` are executed on a different OS. Always use:

`docker save [image] -o file.tar` followed by `docker load -i file.tar`

to prevent these issues. Comparing the TAR files produced by the different methods, you will find that they have a completely different size (303MB against 614MB for me).

docker pull gcr.io/client-mayo-cmhp-pr030309/mayo-netcore-image:latest

docker run -it --entrypoint=sh gcr.io/client-mayo-cmhp-pr030309/mayo-netcore-image:latest

`docker pull` `[mcr.microsoft.com/azure-sql-edge](http://mcr.microsoft.com/azure-sql-edge)`

`sudo docker run --cap-add SYS_PTRACE -e 'ACCEPT_EULA=1' -e 'MSSQL_SA_PASSWORD=Fridley#1' -p 1433:1433 --name bluehouseSql -d` mcr.microsoft.com/azure-sql-edge
`docker start bluehouseSql`

klt-mayo-aspnet-be-1-aqdo

0cc30b21bc60

expired token eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1laWRlbnRpZmllciI6ImUzMTAyYzE1LWI4MDctNDEzNy1hYjc5LTUzODJkNWEwMzcwYyIsImV4cCI6MTY1MjQ2MTc1OH0.rfR94z8zBg-YpoW9gFzJCPQ44jGqCD2Ij7pNre-W4Ps

for doc
3 3 1425

export const useGetToken = (): string | undefined => {
  const [token, setToken] = useState()
  useEffect(() => {
    const token = localStorage.getItem('token')

    if (token) {
      setToken(token)
    }
  }, [])

  return token
}
