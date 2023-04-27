#$steveMailBox = Get-EXOMailbox -UserPrincipalName StevenLandry@LandrypwshTraining.onmicrosoft.com 
$users = (Get-MgUser -all | Where-Object {$_.Mail -ne $null})

foreach($user in $users)
{
    $messages = Get-MgUserMessage -UserId $user.id | Where-Object {$_.Subject -like "*SPAM*"}

    foreach($message in $messages)
    {
        Remove-MgUserMessage -MessageId $message.id -UserId $user.Id -Verbose
    }
}
