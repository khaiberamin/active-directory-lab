# Group Policy Objects (GPO)

Policies to implement:
- Password policy
- Desktop Wallpaper Policy
- Login banner
- Disabling the Control Panel for users

### Password Policy and Account Lockout Threshold
##### Password Policy
It was clear that a password policy was already in place for the domain by default given that there were minimum requirements for passwords when creating new users. Instead of creating a new GPO for a password policy, I decided to modify the existing one to make it more robust.
- In Server Manager dashboard select: Tools -> Group Policy Management
- Navigate to Forest: homelab.local -> Domains -> homelab.local -> Group Policy Objects -> Default Domain Policy [SCREENSHOT]
- right click Default Domain Policy and select "Edit"
- This opens the Group Policy Management Editor window
- Navigate to: Computer Configuration -> Policies -> Windows Settings -> Security Settings -> Account Policies -> Password Policy
- This shows the password policy currently in place with settings such as: Minimum/Maximum password age, minimum password length, complexity requirements, and more [SCREENSHOT]
- The following changes were made to the Password Policy
    - Minimum password length was increased from 7 to 10
    - Maximium password age was increased from 42 days to 60 days
##### Account Lockout Threshold
- The Account Lockout Policy is also located under Account Policies, alongside Password Policy
- The following changes were made to the Account Lockout Policy
    - Account lockout threshold set to 5 attempts
    - Account lockout duration (and reset timer) set to 2 minutes (Note: this was set to a low duration for ease of use in testing. A more appropriate value in real-world setting would be +15 minutes) [SCREENSHOT]
##### Testing New Policies
These updated policies were tested by doing the following:
- Creating a new user and attempting to set the password to something that didn't meet the new Password Policy requirements. I created a new user and attempted to set the initial password to "Password1", but this failed due to the new length requirement being 10 characters. After changing it to "Password123", the user was successfully created, verifying that the new Password Policy was working. [SCREENSHOT]
- Purposely failing to login 5 times with a user account to verify that the Account Lockhold Threshold was working. On the CLIENT01 VM, I attempted to login to the new user account using the incorrect password 5 times. After the fifth unsuccessful attempt, I was temporary locked out, verifying that the Account Lockout Policy was working. After 2 minutes the lockout was reset, just as the new policy described, and I could login succesfully with the correct password. [SCREENSHOT]


### Desktop Wallpaper Policy

### Login Banner 

### Disabling Control Panel 
