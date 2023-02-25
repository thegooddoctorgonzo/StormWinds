#Compare DHCP to Site & Services
$ADSubnets = Get-ADReplicationSubnet -Filter * | Select-Object -ExpandProperty name | sort


#Compare DNS to DHCP scopes
$DHCPScopes = Get-DhcpServerv4Scope