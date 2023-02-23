$SAM = "smithr"

$user = Get-ADObject -Filter {(SamAccountName -eq $SAM)} -IncludeDeletedObjects -Properties *

$user | Restore-ADObject -TargetPath "OU=$ClassType,$OU"