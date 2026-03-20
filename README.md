# Active Directory Homelab Project
## Overview
This Active Directory (AD) Homelab Project simulates the deployment and management of a real world IT environment using virtual machines within a domain. It covers various topics including: 
- Setting up a **Windows Server 2022** VM as the **Domain Controller (DC)**
- Setting up a **Windows 10** client machine and joining it to the domain
- Installing and setting up **Active Directory Domain Services (ADDS)**
- Setting up **DHCP** and **DNS**
- Managing User, **Organizational Unit (OU)**, and **Security Groups**
- Implementing **Group Policy Objects (GPO)**
- Setting up file shares with permissions
- Automating administrative tasks via **PowerShell**


## Project Goals



## Table of Contents
- [Active Directory Environment](#active-directory-environment)
- [Technology Used](#technology-used)
- [Reproducing the Environment](#reproducing-the-environment)
- [Project Documentation](#project-documentation)
- [PowerShell Scripts]
- [Administrative Task Scenarios](#administrative-task-scenarios)
- [Skills Demonstrated](#skills-demonstrated)

## Active Directory Environment
The simulated environment for this project is the Active Directory (AD) managed domain of a Sales and Marketing organization. This organization has multiple departments including: **HR, IT, Marketing, and Sales**. 


## Technology Used
- Virtualization
  - Oracle VirtualBox
- Operating Systems
  - Windows Server 2022 (Domain Controller VM)
  - Windows 10 (Client VM)
- Management and Networking Tools
  - Active Directory Domain Services (ADDS)
  - Dynamic Host Configuration Protocol (DHCP)
  - Domain Name System (DNS)
- Scripting and Automation
  - Powershell
  - Powershell ISE
- Documentation and Version Control
  - GitHub
  - Markdown


## Reproducing the Environment
To recreate the AD Lab environment in this project:
- Create and configure virtual machines for the Server and Client Computers on VirtualBox
-  Install Windows Server 2022 on the Server VM, configuring Domain Controller (DC), Active Directory, and DHCP functionality
-  Install Windows 10 on the Client VM and join it to the domain created by the Domain Controller

Detailed steps avialable in [Project Documentation](#project-documentation).


## Project Documentation
The following files document the process for configuring the project environment and completing the various tasks that simulate an AD management workflow.  

- [Environment Setup](docs/environment-setup.md) - Virtual Machine configuration details
- [Active Directory Setup](docs/active-directory-setup.md) - Active Directory installation and configuration on the Domain Controller VM
- [DHCP Setup](docs/dhcp.md) - Dynamic Host Configuration Protocol setup and verification
- [Client Machine Setup](docs/client-machine-setup.md) - Client VM setup and joining to the domain
- [User Creation and Management](docs/user-creation.md) - User and OU management within the AD environment, including automation scripts
- [Group Policy](docs/group-policy.md) - Implementation of multiple Group Policy Objects (GPOs)
- [Security Groups, File Shares, and Permissions](docs/file-server-and-permissions.md) - Implementation of file shares with access control, using security groups
- [Audit](TODO)
- [Administrative Task Scenarios](docs/administrative-task-scenarios.md)


## Powershell Scripts
Here are the PowerShell Scripts used for their respective purposes in this project
- User Creation Script
  - [CreateUser.ps1](/scripts/CreateUser.ps1) - Creates a single AD user based on provided parameters on the CLI
 
- Bulk User Creation Script
  - [CreateUserBulk.ps1](/scripts/CreateUserBulk.ps1) - Reads new user data from a compatible CSV file to create AD users automatically, improving the efficiency of bulk user creation



## Administrative Task Scenarios




## Skills Demonstrated
- Virtual machine configuration using VirtualBox
- Operating system installation and setup (Windows Server 2022 and Windows 10)
- Active Directory Domain Services (ADDS) installation, setup, and management
- DHCP setup
- Creating users and organizational units (OUs)
- User account management
- Powershell commands
- Automation with Powershell
  - Single user creation
  - Bulk user creation from CSV files
- Group Policy Object (GPO) creation and implementation
  - Password Policy GPO
  - Account Lockout Threshold Policy GPO
  - Desktop Wallpaper Policy GPO
  - Control Panel Access Policy GPO
- Creating and configuring security groups
- File share creation and permission configuration
- Detailed project documentation 


