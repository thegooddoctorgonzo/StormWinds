$user = Get-MgUser -Filter "DisplayName eq 'Bob Smith'"

Update-MgUser -UserId $user.Id -City "Paris"

Update-MgUser -UserId $user.Id -Country "FR"