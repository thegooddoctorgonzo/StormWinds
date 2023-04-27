
$user = Get-MgUser -all | Where-Object {$_.DisplayName -eq "Steven Landry"}

Get-MgUserMessage -UserId $user.id | Where-Object {$_.Subject -like "*SPAM*"}
