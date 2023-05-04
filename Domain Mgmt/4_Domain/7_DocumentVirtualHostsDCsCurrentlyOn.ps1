Import-Module vmware.powercli

$DCs = Get-ADDomainController -Filter * | Select-Object -ExpandProperty name
$creds = Get-Credential
$DcHostList = New-Object System.Collections.ArrayList

Connect-VIServer -Credential $creds -Server VCenter1

foreach($DC in $DCs)
{
    $info = Get-VM -name $dc | Select-Object -Property VMHost, name
    $DcHostList.Add($info)

}

$DcHostList