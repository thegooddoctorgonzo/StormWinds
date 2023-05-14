$user = Get-MgUser -Filter "DisplayName eq 'Bob Smith'"

Update-MgUser -UserId $user.Id -City "PHX"

Update-MgUser -UserId $user.Id -Country "US"