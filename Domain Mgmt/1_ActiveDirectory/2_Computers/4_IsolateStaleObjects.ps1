$daysInactive = 90

$timeStamp = (Get-Date).AddDays(-($daysInactive))

$staleComputers = Get-ADComputer -Filter {LastLogonTimeStamp -lt $timeStamp -and Enabled -eq $true} -Properties LastLogonTimeStamp


foreach ($computer in $staleComputers) 
{

    Move-ADObject -Identity $computer -TargetPath "OU=Quarantine-Computers,DC=zoneb,DC=com"

    Write-Host "Moved stale computer $($computer.Name) to Quarantine OU"

}