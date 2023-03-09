
Get-MgUserMessage -UserId $user.id | Where-Object {$_.Subject -like "*SPAM*"}
