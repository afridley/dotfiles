# Introduction
Welcome to the UAT testing for Purina Universal Profile. 

PUP Has 2 Front end components. 
* The application
* The module/script to integrate with the application.
The module/script is placed on a site that wishes to integrate with SSO (in our case Purina.com). This handles authenticating the user for the site. Once the user is logged in on the site. The script will also link out to The PUP Application.

# Things to look for as a UAT tester
* Any integration errors. Problems when you go from the h20-dev.purina.com -> dev-myprofile.purina.com. and when returning from the application to purina.com
* Any SSO flow errors or improvements. (errors while signing in, Signing out, Signing up)
* Any text or misspellings that are out of place
* 403 Forbidden error on hosted ui (login).
	* There is an issue that has started showing up in dev that we are evaluating. This issue shows up when a user first visits the login-dev.purina.com domain which is the login domain. Sometimes a user is presented with a 403 forbidden page.
	* Please note any instance and the number of times this happens to you.
	* **How to resolve:** If this happens to you please refresh the page multiple times. This should bring you to the login page properly.
* Because we are integrated on a Purina.com domain with the same clientId. The user journey should be seamless (since we share the same cookie). If you are logged in on Purina.com you should be logged in on Universal profile and vice versa. Any issues 
* Points and pet information in the application is refreshed every 5 minutes. If the user leaves the tab and comes back or if an action that would change these values happens (add pet). We are still finalizing how often we should check if this information has been updated and if it should be a different value for pets and points.

# MVP Feature List
Please see https://purina-nbm.atlassian.net/wiki/spaces/H20/pages/525565953/PUP+E2E+Test+Priorities+-+GO+LIVE

For a list of features that should be working and supported for MVP launch.

The list also includes notes about post mvp features. and Known issues by feature.
# Known Issues and limitations.

* Currently there is no way to call the Loyalty api from a client side application without exposing an api key that cant be exposed.
	* This means that on Purina.com the Users points will not be updated until the token updates. They will have the correct point count once they are on Universal profile
		* We are investigating a way around this.
		* Loyalty is also working on integrating with the cognito token so that we can validate without exposing the application level key.

# How to start testing
1. Visit https://h20-dev.purina.com.
2. Click the Login user profile icon at the top
3. In the fly-out menu you should see buttons to login or to create account.
4. Click Create Account
5. Go through the sign-up flow.
	* NOTE: This will send a verification email that you need to accept.
	* If you create to many users you may get flagged by advanced security and no longer be able to receive a verification email
	* If you do not receive a verification email please post in the UAT Slack and a dev can verify the account for you
6. Accept the verification email.
7. Click back to the tab where you signed up.
8. You should see verification successful. (this may take a few seconds depending on your connection speed).
9. There will be a button on the bottom of the screen that should say go back to Purina.com.
10. Click the button.
11. You should now be back on Purina.com and after a few seconds you should see that the login button has changed to the first letter of the first name you entered.
	* NOTE: We are able to do this seamlessly for Purina.com because we are a subdomain of Purina.com. When pet-finder is added a pet-finder user would need to perform a user action to be auto logged in. Unless AWS adds Silent Login.
12. Now that you are logged in on Purina.com and seamlessly logged in on PUP you can click your User Account icon to open the menu.
13. The menu will have several items that will navigate you to different sections of PUP.
14. Feel free to click any of these options to begin exploring the application.
15. Try adding a pet, Changing password, editing user or pet information.
16. On the addition of your first pet you should receive 400pts

