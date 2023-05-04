$daysInactive = 90​

$timeStamp = (Get-Date).AddDays(-($daysInactive))​

$staleAccounts = Get-ADUser -Filter {LastLogonTimeStamp -lt $timeStamp -and Enabled -eq $true} -Properties LastLogonTimeStamp​

​

foreach ($account in $staleAccounts) {​

    Disable-ADAccount -Identity $account​

    Write-Host "Disabled stale account $($account.Name)"​

}