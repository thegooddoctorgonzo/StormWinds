$osVer = Get-ComputerInfo -Property OsVersion | Select-Object -ExpandProperty OSVersion
$env:COMPUTERNAME
$locAdmin = Get-LocalGroupMember -Group "Administrators" | Where-Object {$_.PrincipalSource -eq "Local"} | Select-Object -ExpandProperty Name
$uptime = Get-ComputerInfo -Property OsUptime | Select-Object -ExpandProperty OSUpTime
$psVer = $PSVersionTable | Select-Object -ExpandProperty PSVersion


$reportTemplate = New-Object -TypeName psobject
Add-Member -InputObject $reportTemplate -MemberType NoteProperty -Name OSVersion -Value $null
Add-Member -InputObject $reportTemplate -MemberType NoteProperty -Name LocalAdmin -Value $null
Add-Member -InputObject $reportTemplate -MemberType NoteProperty -Name HostName -Value $null
Add-Member -InputObject $reportTemplate -MemberType NoteProperty -Name UPtime -Value $null
Add-Member -InputObject $reportTemplate -MemberType NoteProperty -Name PSversion -Value $null

$report = $reportTemplate | Select-Object *

$report.LocalAdmin = $locAdmin
$report.OSVersion = $osVer
$report.HostName = $env:COMPUTERNAME
$report.UPtime = $uptime
$report.PSversion = $psVer
