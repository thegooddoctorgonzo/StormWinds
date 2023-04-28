$user = Get-MgUser -Filter "DisplayName eq 'Bob Smith'"

Update-MgUser -USerId $user.Id -City "PHX"

Update-MgUser -USerId $user.Id -AccountEnabled:$false