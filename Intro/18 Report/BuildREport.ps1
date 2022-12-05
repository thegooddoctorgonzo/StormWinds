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

$report = New-Object System.Collections.ArrayList

$tempReport = $reportTemplate | Select-Object *

$tempReport.LocalAdmin = $locAdmin
$tempReport.OSVersion = $osVer
$tempReport.HostName = $env:COMPUTERNAME
$tempReport.UPtime = $uptime
$tempReport.PSversion = $psVer

$report.add($tempReport)