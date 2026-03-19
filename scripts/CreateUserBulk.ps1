
param(
    [string]$CSVPath
    )

Import-Module ActiveDirectory -ErrorAction Stop

$Users = Import-Csv -Path $CSVPath

$Domain = "homelab.local"
$FirstHalfDomain = $Domain.Split('.')[0]
$SecondHalfDomain = $Domain.Split('.')[1]
$Password = "Password123"

foreach ($User in $Users) {
   
   New-ADUser `
   -Name "$($User.FirstName) $($User.LastName)" `
   -GivenName $User.FirstName `
   -Surname $User.LastName `
   -SamAccountName $User.AccountName `
   -UserPrincipalName "$($User.AccountName)@$Domain" `
   -Path "OU=$($User.OU),DC=$FirstHalfDomain,DC=$SecondHalfDomain" `
   -AccountPassword (ConvertTo-SecureString "$Password" -AsPlainText -Force) `
   -ChangePasswordAtLogon $true `
   -Enabled $true

   $GroupName = "$($User.OU)_Group"
   Add-ADGroupMember -Identity $GroupName -Members $User.AccountName

   Write-Host "Created User $($User.FirstName) $($User.LastName) in $($User.OU)"
    
}
   

#end of script ------------------------------