Get-AzPublicIpAddress | Where-Object {$_.DnsSettings.fqdn -like "*swvm1*"} | Select-Object -Property ipaddress

Get-AzLog -StartTime (get-date).AddDays(-1)

Stop-AZvm -name “SWVM1” -resourceGroupName “SW1”

Start-AZvm -name “SWVM1” -resourceGroupName “SW1”

Get-AzResource

Get-AzVMUsage -Location westus3

Get-AzVM –Status