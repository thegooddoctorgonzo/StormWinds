$ou = Get-ADObject -Identity "OU=VirtDesktops,DC=zoneb,DC=com"
$comp = Get-ADComputer -Filter 'name -eq "computer1"'

Get-ADComputer -Identity $comp | Move-ADObject -TargetPath $ou