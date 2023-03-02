# list blocked user accounts
Get-MgUser -Filter "AccountEnabled eq false"

#list table of current users
Get-MgUser -All -Filter "AccountEnabled eq true" | Select-Object -Property DisplayName, mail, City | Format-Table



