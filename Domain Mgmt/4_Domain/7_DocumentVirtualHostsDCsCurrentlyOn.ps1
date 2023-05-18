#create a new VM dc-alpha

Import-Module vmware.powercli

#$DCs = Get-ADDomainController -Filter * | Select-Object -ExpandProperty name
$DCs = "dc-alpha"

$VCcreds = Get-Credential

$DcHostList = New-Object System.Collections.ArrayList

Connect-VIServer -Credential $VCcreds -Server 10.23.33.139 ######## < check IP ################################

foreach($DC in $DCs)
{
    $info = Get-VM -name $dc | Select-Object -Property VMHost, name
    $DcHostList.Add($info)
}

$DcHostList