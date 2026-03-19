
param(
    [string]$FirstName,
    [string]$LastName,
    [string]$AccountName,
    [string]$OU,
    [string]$Domain = "homelab.local",
    [string]$Password = "Password123"
    )

Import-Module ActiveDirectory -ErrorAction Stop

$FirstHalfDomain = $Domain.Split('.')[0]
$SecondHalfDomain = $Domain.Split('.')[1]

New-ADUser `
-Name "$FirstName $LastName" `
-GivenName "$FirstName" `
-Surname "$LastName" `
-SamAccountName "$AccountName" `
-UserPrincipalName "$AccountName@$Domain" `
-Path "OU=$OU,DC=$FirstHalfDomain,DC=$SecondHalfDomain" `
-AccountPassword (ConvertTo-SecureString "$Password" -AsPlainText -Force) `
-ChangePasswordAtLogon $true `
-Enabled $true

$GroupName = "${OU}_Group"

Add-ADGroupMember -Identity $GroupName -Members $AccountName

#end of script ------------------------------