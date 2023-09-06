> Note the Designs for some parts of this flow are either incomplete or Just completed so we will need to test Look and Feel separately.
> 
> This should mainly be focusing on functionality.


1. Visit https://h20dev-pocpupmodule.gatsbyjs.io/
	1. Must be on the VPN to visit this page
2. Notice that there is a profile icon in the top right
	1. Currently this must wait until page completely loads to be interactive. So initial click may not work depending on when you click. This can be reported as a bug It needs to be fixed on the Purina.com side. Seems to be something with bazaarvoice
3. Click the grey profile icon
4. Notice that a flyout menu opens
5. The menu should currently have "Create Purina Account button" and "Login Button"
6. Click create account
7. Fill out each step as you go through
	1. Make sure for email you use a real email
	2. You can use + ex myemail+1@gmail.com to get additional users
		1. I was only able to get up to +5 before i was flagged for a few days so be carefull with the amount you create.
	3. Make sure you remember the password
8. Once you make the final password you will be sent an email
9. You can click the resend button to make sure it will resend verification
10. Once you verify your email, You will see a page in cognito that says verification complete. But you won't be sent anywhere
	1. We can log a bug or improvement to direct the user back to the site they signed up from after email verification.
11. Return to https://h20dev-pocpupmodule.gatsbyjs.io/
12. Click "Login" this time and login with the account you created
13. You will be returned to  https://h20dev-pocpupmodule.gatsbyjs.io/
14. Notice that after site load the profile icon should turn red and and have the first letter of your first name.
15. If you click on it you will be shown Profile related links
16. These links go to incomplete / non existent pages currently. Though you are able to logout from this menu.

Expectation is a user is able to create an account and then Login with that account. Once logged in the icon should turn red and display the users name and points. Along with links to profile and logout. (The profile section has not currently been built out).