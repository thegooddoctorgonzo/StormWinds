#Compare DHCP to Site & Services
$ADSubnets = Get-ADReplicationSubnet -Filter * | Select-Object -ExpandProperty name | Sort-Object


#Compare DNS to DHCP scopes
$DHCPScopes = Get-DhcpServerv4Scope