Get-ADObject -IncludeDeletedObjects -Filter * -Properties * | Where-Object {$_.deleted -eq $true} |  Select-Object whenChanged, distinguishedName