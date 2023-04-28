# get users with inline filter
Get-MgUser -Filter "startswith(UserPrincipalName, 'BobSmith')"

Get-MgUser -Filter "DisplayName eq 'Bob Smith'"

# get users with piped to filter
Get-MgUser -all | Where-Object {$_.DisplayName -eq "Bob Smith"}

Get-MgUser -all | Where-Object {$_.Mail -eq $null}

# compare user counts
Write-Host "Total Users: $((Get-MgUser -Count userCount -ConsistencyLevel eventual).count)`n Users without email: $((Get-MgUser -all | Where-Object {$_.Mail -eq $null}).count)"

Get-MgUser -Count userCount -ConsistencyLevel eventual
$global:userCount