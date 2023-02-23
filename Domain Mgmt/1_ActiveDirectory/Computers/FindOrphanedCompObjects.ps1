$oldComps = New-Object system.collections.arraylist
$comps = Get-ADComputer -SearchBase "CN=Computers,DOMAIN" -Filter '*' -Properties name, distinguishedname, lastlogontimestamp  | Sort-Object distinguishedName

foreach($comp in $comps)
{
    if(((Get-Date($comp.lastLogonTimestamp)).AddYears(1600) -lt (Get-date).AddDays(-90)) -or $null -eq $comp.lastLogonTimestamp)
    {
        $oldComps.add($comp) | Out-Null
    }
}

$oldComps | Select-Object name, distinguishedName, @{Name="LastLogon";Expression={(Get-Date($_.lastLogonTimestamp)).AddYears(1600)}}  | Format-Table 
