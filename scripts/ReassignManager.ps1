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