# Creation of Users and Organization Units in Active Directory

## Goal
Learn how to create Users and Organization Units (OUs) within the domain.

### Creating Users
- In Active Directory Users and Computers, right click Users container and select "New", then "User"
- Enter First and Last name, username, and password for new User and finish
- Verify new user appears in the Users container
<img src="../screenshots/user-creation/creating-user-name.png" width="600">

### Creating Organizational Units
- Created Organizational Units for each department in a hypothetical organization, including HR, IT, Marketing, and Sales
- Done by right clicking the domain name (homelab.local), selecting New -> Organizational Unit, and naming it
- Additional Users were created and placed into each OU following same steps as above section
<img src="../screenshots/user-creation/create-OU.png" width="600">

### Resetting Password
- Simulating the case of a user forgetting their password and requesting a password reset
- User Wally West requests password reset
- Navigate to Marketing OU and right click Wally West
- Click "Reset Password" and enter a new password
- Keep "User must change password at next logon" checked to ensure Wally West changes his password at next logon
<img src="../screenshots/user-creation/user-password-reset.png" width="600">

### Single User Creation with Powershell
- Instead of using the GUI to create users, we will use Powershell commands to complete the job
- Use the "New-ADUser" cmdlet and fill in the basic User parameters as follows
```powershell
New-ADUser `
-Name "Peter Parker" `
-GivenName "Peter" `
-Surname "Parker" `
-SamAccountName "pparker" `
-UserPrincipalName "pparker@homelab.local" `
-Path "OU=Marketing,DC=homelab,DC=local" `
-AccountPassword (ConvertTo-SecureString "Password123" -AsPlainText -Force) `
-ChangePasswordAtLogon $true `
-Enabled $true
```
This creates a User named Peter Parker with username "pparker" in the Marketing OU. The password is set to the default "Password123" and a change of password is required at logon. This command effectively mimics the User creation process done earlier via the GUI in Active Directory Users and Computers. After running this command, running 
```powershell
Get-ADUser pparker
```
will verify that the new user was created and display user info. 

[SCREENSHOT]

### User Creation with a Reusable Script in Powershell



### Bulk User Creation in Powershell


