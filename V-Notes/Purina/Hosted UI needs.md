Currently we need the ability to customize the hosted ui more then it currently is
## How this is accomplished in other IDP's
In Auth0 for example you are given html control of the login page. and of each flow page. They allow you to upload your own React application and give an api for interacting with the elements on each page.

Azure B2C has a similar but less robust solution as Auth0 gives you several optional libraries for interacting with their oauth functions from within their hosted UI. This gives the dev a large amount of control over the flow.

### Asks
1. The ability to customize the html for each allowed flow including adding a js script or bundle
	1. Login
	2. Sign up
	3. Forgot password
2. The docs and ability to trigger the necessary actions to complete the flow. 
	1. In other words in the custom html we still need to know how to click Sign up and what id's etc need to be on the inputs so that we can send the Sign up form.
