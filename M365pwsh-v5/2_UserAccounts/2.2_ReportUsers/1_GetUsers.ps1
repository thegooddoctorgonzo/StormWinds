# get users with inline filter
Get-MgUser -Filter "startswith(UserPrincipalName, 'BobSmith')"

Get-MgUser -Filter "DisplayName eq 'Bob Smith'"

# get users with piped to filter
Get-MgUser -all | Where-Object {$_.DisplayName -eq "Bob Smith"}

