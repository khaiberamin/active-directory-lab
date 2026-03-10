# Client Machine Setup

## Goal
Create Client VM (CLIENT01) 

## Client Machine Setup Steps
- Download Windows 10 ISO via Media Creation Tool
- Configure CLIENT01 VM with proper settings (4 GB Memory, 1 CPU Core, 50 GB Hard Disk)
- In the VM Settings -> Network Tab, set Adapter 1 to "Host-only Adapter"
- This will mean CLIENT01 will be on the same network as DC01
- Start VM and follow Windows installation instructions
- Set CLIENT01 local admin username(user01) and password
- Verify that IPv4 is set to "Obtain IP address automatically" for DHCP to work
- Verify that IPv4 DNS server is set to the IP of DC01 (192.168.56.10)
- Verify DHCP and DNS work properly [SCREENSHOT NEEDED]

### Joining CLIENT01 to the Domain Steps
- In Settings -> System -> About, select "Rename this PC (advanced)
- Select "Change..." to rename computer to "CLIENT01" and set the Domain to "homelab.local" [SCREENSHOT HERE]
- Enter Administrator credentials to join domain successfully [SCREENSHOT HERE]
- After the necessary reboot, logged into CLIENT01 with HOMELAB\Administrator account to verify that the client machine is connected to the domain [2 SCREENSHOTS HERE]
- Back in the Domain Controller (DC01), checked the DHCP Window to ensure that the Client machine's lease appeared in the Address Leases folder [SCREENSHOT HERE]
- Also checked Active Directory Users and Computers to ensure that Client machine appeared in the list of Computers in the domain [SCREENSHOT HERE]
- 
