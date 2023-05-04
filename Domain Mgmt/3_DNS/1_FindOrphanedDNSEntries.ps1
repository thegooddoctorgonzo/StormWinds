# collect DNS records
$dns = Get-DnsServerResourceRecord -ZoneName zoneb.com -ComputerName DC-ALPHA | Where-Object {$_.timestamp -eq $null -and $_.RecordData.IPv4Address.IPAddressToString -like "*.*.*.*"} | Sort-Object hostname

#create new custom object
$objTemplateObject = New-Object -TypeName psobject

$objTemplateObject | Add-Member -MemberType NoteProperty -Name HostName -Value $null
$objTemplateObject | Add-Member -MemberType NoteProperty -Name IP -Value $null

# create array of custom objects
$noPing = New-Object System.Collections.ArrayList

foreach($addr in $dns)
{
    # test ping of hosts
    if(!(Test-Connection -ComputerName $addr.RecordData.IPv4Address.IPAddressToString -Count 1 -Quiet))
    {
        $objTemp = $objTemplateObject | Select-Object *

        $objTemp.HostName = $addr.HostName
        $objTemp.IP = $addr.RecordData.IPv4Address.IPAddressToString

        $noPing.Add($objTemp) | Out-Null
    }
}

$noPing