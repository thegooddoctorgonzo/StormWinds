$user = Get-MgUser -Filter "DisplayName eq 'Bob Smith'"

Revoke-MgUserSignInSession -UserId $user.id       
Update-MgUser -UserId $user.Id -AccountEnabled:$false