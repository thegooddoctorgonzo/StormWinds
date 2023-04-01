$daysInactive = 90
$timeStamp = (Get-Date).AddDays(-($daysInactive))
$staleComputers = Get-ADComputer -Filter {LastLogonTimeStamp -lt $timeStamp -and Enabled -eq $true} -Properties LastLogonTimeStamp

foreach ($computer in $staleComputers) {

    Disable-ADAccount -Identity $computer

    Write-Host "Disabled stale computer $($computer.Name)"

}