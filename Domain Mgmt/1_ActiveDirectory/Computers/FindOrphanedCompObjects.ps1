$oldComps = New-Object system.collections.arraylist
$comps = Get-ADComputer -SearchBase "DC=zoneb,DC=com" -Filter '*' -Properties name, distinguishedname, lastlogontimestamp  | Sort-Object distinguishedName

foreach($comp in $comps)
{
    if(((Get-Date($comp.lastLogonTimestamp)).AddYears(1600) -lt (Get-date).AddDays(90)))
    {
        $oldComps.add($comp) | Out-Null
    }
}

$oldComps | Select-Object name, distinguishedName, @{Name="LastLogon";Expression={(Get-Date($_.lastLogonTimestamp)).AddYears(1600)}}  | Format-Table 
