# collect server list
#$vms = Get-VM -Server alvcsvsi01.ad.peoavn.army.mil | Where-Object {$_.PowerState -eq "PoweredOn" -and $_.Guest -like '*Windows Server*'}
$vms = Get-ADComputer -Filter 'operatingSystem -like "*Windows Server*"'

#initialize lists fot SQL and WEB servers
$SQLvms = New-Object System.Collections.ArrayList
$WEBvms = New-Object System.Collections.ArrayList

foreach($vm in $vms)
{
    if(Get-Service -ComputerName $vm.name -ErrorAction SilentlyContinue -WarningAction SilentlyContinue -InformationAction SilentlyContinue | Where-Object {$_.Name -eq "SQLBrowser"})
    {
        $SQLvms.add($vm.name) | Out-Null
    }
}

foreach($vm in $vms)
{
    if((Invoke-Command -ComputerName $vm.name -ScriptBlock { Get-WindowsFeature | Where-Object {$_.installed -eq $true -and $_.name -eq "Web-Server"}}) -or (Get-Service  -ComputerName $vm.name -ErrorAction SilentlyContinue -WarningAction SilentlyContinue -InformationAction SilentlyContinue | Where-Object {$_.name -like "*tomcat*" -or $_.name -like "*apache*"}))
    {
        $WEBvms.add($vm.name) | Out-Null
    }
}