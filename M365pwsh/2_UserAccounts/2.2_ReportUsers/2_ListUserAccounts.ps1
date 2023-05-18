# list blocked user accounts
Get-MgUser -Filter "AccountEnabled eq false"

#list table of current users
Get-MgUser -All -Filter "AccountEnabled eq true" | Select-Object -Property DisplayName, mail, City | Format-Table

Get-MgUser -all | Where-Object {$_.Mail -eq $null}

# compare user counts
Write-Host "Total Users: $((Get-MgUser -Count userCount -ConsistencyLevel eventual).count)`n Users without email: $((Get-MgUser -all | Where-Object {$_.Mail -eq $null}).count)"

# to use advanced query capabilities ConsistenctLevel must be specified and a count variable declared
Get-MgUser -Count userCount -ConsistencyLevel eventual
$global:userCount

