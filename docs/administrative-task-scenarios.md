# Administrative Task Scenarios

## Goal
The goal of this section is to simulate real AD administrative scenarios and successfully troubleshoot and solve problems.

### Scenario 1 - User is Locked Out of Account
The first scenario to solve is the issue of a User being locked out of their account after too many incorrect password attempts. 
Steps:
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



### Scenario 2 - HR Manager leaves organization and vaccant position is filled via internal promotion. Modify relevant User Accounts.
TODO

### Scenario 3 - Member of Sales is moved to Marketing
TODO

### Scenario 4 - Organization hired 20 new interns into the Marketing Department. CSV file containing intern information is provided. Create user accounts for interns.
TODO

### Scenario 5 - HR requests audit of all interns
TODO
