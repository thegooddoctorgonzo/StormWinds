$vms = Get-VM -Server alvcsvsi01.ad.peoavn.army.mil | Where-Object {$_.PowerState -eq "PoweredOn" -and $_.Guest -like '*Windows Server*'}
$SQLvms = New-Object System.Collections.ArrayList

foreach($vm in $vms)
{
    if(get-SErvice  -ComputerName $vm.name -ErrorAction SilentlyContinue -WarningAction SilentlyContinue -InformationAction SilentlyContinue | Where-Object {$_.Name -eq "SQLBrowser"})
    {
        $SQLvms.add($vm.name) | Out-Null
    }
}


$vms = Get-VM -Server alvcsvsi01.ad.peoavn.army.mil | Where-Object {$_.PowerState -eq "PoweredOn" -and $_.Guest -like '*Windows Server*'}
$WEBvms = New-Object System.Collections.ArrayList

foreach($vm in $vms)
{
    if((Invoke-Command -ComputerName $vm.name -ScriptBlock { Get-WindowsFeature | where {$_.installed -eq $true -and $_.name -eq "Web-Server"}}) -or (Get-Service  -ComputerName $vm.name -ErrorAction SilentlyContinue -WarningAction SilentlyContinue -InformationAction SilentlyContinue | Where-Object {$_.name -like "*tomcat*" -or $_.name -like "*apache*"}))
    {
        $WEBvms.add($vm.name) | Out-Null
    }
}