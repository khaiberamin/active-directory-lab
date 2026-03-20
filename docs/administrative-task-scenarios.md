# Administrative Task Scenarios

## Goal
The goal of this section is to simulate real AD administrative scenarios and successfully troubleshoot and solve problems.

### Scenario 1 - User is Locked Out of Account
The first scenario to solve is the issue of a User being locked out of their account after too many incorrect password attempts. 
#### Steps:
- On Client Machine, attempt to login to an account with the incorrect password +5 times
- This will trigger the Account Lockout Threshold Policy, locking the user account
[SCREENSHOT]

- Verify the User's credentials and identity before proceeding with unlocking their account
- On the DC Machine, in PowerShell, run the following command to search for **locked accounts**
```powershell
Search-ADAccount -LockedOut
```
- This will show the account details of the AD user that was previously locked out, in this case, Clark Kent
- In Powershell, run the following command to unlock the locked account
```powershell
Unlock-ADAccount -Identity "<username>"
```
- Afterwards, run the search command again to verify that the account in question no longer appears. This ensures that the account is now unlocked.
```powershell
Search-ADAccount -LockedOut
```

- Back on the Client Machine, log in with the correct password to verify that the user can log in
[SCREENSHOT]


<br>

### Scenario 2 - HR Manager leaves organization and vacant position is filled via internal promotion. Modify relevant User Accounts.
In this scenario, the HR Manager is leaving the organization and their position is being filled by another employee in the HR department. This involves AD account offboarding, changing user security group memberships, and moving users between OUs.

Currently, the HR Manager is user *Jane Doe*, and the new HR Manager will be the user *Oliver Queen*. 

*Note: There is currently no Organizational Unit (OU) for Former Employees, which may be useful for organization purposes, so the OU "Former Employees" is created.

#### Steps:
- Disable the former manager's account in Active Directory Users and Computers by right-clicking the account and selecting *Disable Account*
- Drag and drop the former manager's account from the HR OU to the Former Employees OU
- In order to remove the former manager from the *HR* and *HR_Manager* security groups do the following:
    - open user *Properties* of the former manager
    - in the *Member Of* tab, select both the *HR_Group* and the *HR_Manager_Group*
    - Select *Remove*, and confirm [SCREENSHOT]

- In order to add the new manager to the *HR_Manager* security group, follow the same steps, but *Add* and then type in and select "HR_Manager_Group"
- Update the "Manager" attribute of the new manager by doing the following:
    - open user *Properties*
    - in the *Organization* Tab, press *Clear* to remove the old manager from the *Manager* attribute of the new manager
    - *Note: If the new manager has their own manager, simple add that username to the *Manager* attribute instead
- All AD users that pointed to the old manager's AD user must now update their "Manager" attribute. Since this can be a large number of users, it is best to use a PowerShell script to complete this step
    - The following [PowerShell script](../scripts/ReassignManager.ps1) will change the "Manager" attribute of all AD users who currently point to the old manager, replacing the attribute with the new manager
```powershell
param(
    [Parameter(Mandatory=$true)]
    [string]$OldManagerUsername,
    
    [Parameter(Mandatory=$true)]
    [string]$NewManagerUsername
)

$oldManager = Get-ADUser -Identity $OldManagerUsername
$newManager = Get-ADUser -Identity $NewManagerUsername

Get-ADUser -Filter {Manager -eq $oldManager.DistinguishedName} |
ForEach-Object {
  Set-ADUser -Identity $_ -Manager $newManager.DistinguishedName
  Write-Output "Changing Manager of user $($_.SamAccountName) from $OldManagerUsername to $NewManagerUsername"
}
```
-After running the script, verify that all Users in the HR OU (besides the new manager) have the new manager as their "Manager" property. This can be done with the following PowerShell command on the CLI:
```powershell
Get-ADUser -Filter * -SearchBase "OU=HR,DC=homelab,DC=local" -Properties Manager | Select-Object SamAccountName, Manager
```
-In this case, it shows that all users in the HR OU now have user Oliver Queen as their Manager, with the exception of Oliver Queen, who does not have a Manager.
[SCREENSHOT]


### Scenario 3 - Member of Sales is moved to Marketing
TODO

### Scenario 4 - Organization hired 20 new interns into the Marketing Department. CSV file containing intern information is provided. Create user accounts for interns.
TODO

### Scenario 5 - HR requests audit of all interns
TODO
