Get-AzPublicIpAddress | Where-Object {$_.DnsSettings.fqdn -like "*swvm1*"} | Select-Object -Property ipaddress

Get-AzLog -StartTime (get-date).AddDays(-1)

