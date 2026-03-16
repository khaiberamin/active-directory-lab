# File Server Setup and File Permissions via Security Groups

## Goal: Implement File Shares for each Department with proper permissions set (Only department users can access respective file Shares)

First, Security Groups must be made for each department (HR, IT, Marketing, and Sales)
- In Active Directory Users and Computers, create a new OU named "Groups". This will store the groups for each department
- Right-click Groups, select "New", select "Group". This will prompt the Group creation pop-up. Fill out the names for each respective group: HR_Group, IT_Group, Marketing_Group, and Sales_Group [SCREENSHOT]
- To add users to Groups: select a group that you want to add users to.
- In the Members tab, click "Add"
- Enter the names of the users to add to the given group
- Another way to add Users to a Group is to navigate the the User in their respective OU, right-click the User, select "Add to a group", then type to name of the group to add them to [SCREENSHOT]


Shares must be made on the DC file explorer. (Note: Normally a seperate machine would be used as a File Server, but for the simplicity of this lab, the file Shares will be located directly on the DC Machine).
Steps:
- On DC C drive, create a new folder "Shares", and inside this folder, create 4 new folders for each department Share ("HR_Share", "IT_Share", "Marketing_Share", "Sales_Share")
- To enable sharing of each folder, right-click the folder, open Properties, go to the Sharing tab, Advanced Sharing, check box "Share this folder", click "Permissions", select "Full Control" for Everyone and apply changes.
- This gives all Users access to each of these folders via their respective network paths. In order to enforce permissions, we use the Security Tab of each Share as follows
- right-click a Share folder and open Properties
- In Security tab, select "Advanced"
- Select "Disable inheritance"
- Select "Convert inherited permissions into explicit permissions on this object"
- This allows us to edit the permissions of each Share folder. Previously, the Share folders were inheriting permissions for the C:\ drive, so removing Users from the list of objects with permissions was not possible
- Now, in Security tab, select "Edit" to edit permissions
- Remove "Users (HOMELAB\Users)" from the list of groups/users
- Select "Add" and type the name of the group to give access to the Share [SCREENSHOT]
- The Group name will appear in the list of objects. Click the group name and Allow the Modify permission for this group [SCREENSHOT]
- Repeat this process of all 4 Shares with their respective Groups

### Testing from Client VM
From the Client machine, we can test that the Share permissions are working as expected by logging in with Users from each of the department Groups are attempting to access each of the Shares. 
- I logged into CLIENT01 as user Jane Doe of HR. The HR_Share was accessible, but the other 3 shares were not. [SCREENSHOT] [SCREENSHOT]
- I logged in as user Arthur Curry of IT. The IT_Share was accessible, but the other 3 shares were not
- I logged in as user Wally West of Marketing. The Marketing_Share was accessible, but the other 3 shares were not
- I logged in as the user Barry Allen of Sales. The Sales_Share was accessible, but the other 3 shares were not
- Share permissions for these 4 groups works as expected
