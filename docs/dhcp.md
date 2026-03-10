# Dynamic Host Configuration Protocol (DHCP) Setup for DC01

## Goal
Setup DHCP for the Domain Controller VM to provide automatic IP address assignment to client computers that enter the Host-Only network.

## Steps
- Click "Add roles and features"
- In Server Roles, select DHCP. Confirm, then Install
- Open the DHCP Window from: Tools -> DHCP
- In the Scope Wizard, set name of scope to "192.168.56.100-200", with description "Host Only Scope".
  The IP Range starts at 192.168.56.100 and ends at 192.168.56.200 with Subnet mask 255.255.255.0, Length 24.
  Lease duration was set to 8 days.
- Select option to configure DHCP options now
- Left default gateway option blank (not needed for Host Only Network)
- Confirm that the parent domain used for DNS is homelab.local, and that the IP matches (192.168.56.10)
- Select option to activate the scope right away
- Once Scope Wizard is complete, right-click the DHCP server name in the DHCP window, click Authorize, and then Refresh
- DHCP functionality can be verified once a client VM joins the network

### Verifying DHCP Functionality
- CLIENT01 VM running Windows 10 created with Host-Only Adapter, connecting it to same network as DC01
- run ipconfig on CLIENT01 shows the IPv4 address of 192.168.56.102, which is within the range specified in the DHCP scope [SCREENSHOT HERE]
