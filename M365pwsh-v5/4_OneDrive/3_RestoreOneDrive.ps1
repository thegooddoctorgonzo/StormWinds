Get-SPOSite -IncludePersonalSite:$true -Filter {url -like "*bobsmith*"}

Remove-SPOSite -Identity $bobsite -Verbose

Get-SPODeletedSite -IncludePersonalSite:$true

Restore-SPODeletedSite -Identity $bobsite