# Do we need one trust 

There are two aspects

1. The script
2. The Profile and sign up flow application

## The script
The script should not need Onetrust on the script as the product site if they need Onetrust will have it.

The script will also not have any analytics baked into it. 
It wont save any cookies except to store state and authentication state

> On major thing to note is that from our testing Onetrust has the potential to break AWS Cognito SDK where a user that comes from login wont be logged in due to Onetrust blocking the cookie.

## The Profile and SignUp application
The profile application will use the following cookies

* Cookies to manage login state and tokens
* Cookies to store actions a user has performed so they don't need to perform them again. These cookies will not be shared and only exist for the application (this may come from an api in the future).

These both fall under Functional Cookies or Cookies that exist just as local data storage on the users machine and we do not collect them nor do they ever reach our servers.

All of these are 1st party cookies

From just the above I do not believe we need Onetrust.

### Caveat Analytics
If analytics places any third party cookies or attempts to collect and store user actions or data with cookies. We will need onetrust. 

>There may be additional requirements around when a user wishes to be forgotten and deletes their account that needs to bubble out to Ansira, Analytics, and any one else that has data on the user. As we must provide a right to be forgotten.

Im assuming Analytics probably does do this but I cant be sure.
