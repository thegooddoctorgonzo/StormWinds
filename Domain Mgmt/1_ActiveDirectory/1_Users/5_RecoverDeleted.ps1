$SAM = "smithr"

$user = Get-ADObject -Filter {(SamAccountName -eq $SAM)} -IncludeDeletedObjects -Properties *

$user | Restore-ADObject -TargetPath "CN=Users,DC=zoneb,DC=com"