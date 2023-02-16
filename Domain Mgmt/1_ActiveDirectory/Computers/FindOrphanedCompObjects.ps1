$oldComps = New-Object system.collections.arraylist
$comps = Get-ADComputer -SearchBase "CN=Computers,DC=Ad,DC=PEOAVN,DC=Army,DC=mil" -Filter 'name -notlike "POD*"' -Properties name, distinguishedname, lastlogontimestamp  | Sort-Object distinguishedName

foreach($comp in $comps)
{
    if(((Get-Date($comp.lastLogonTimestamp)).AddYears(1600) -lt (Get-date).AddDays(-90)) -or $comp.lastLogonTimestamp -eq $null)
    {
        #write "$($user.name) ____ $((Get-date($user.lastLogonTimestamp)).AddYears(1600))" 
        $oldComps.add($comp) | Out-Null
    }
}

$oldComps | Select-Object name, distinguishedName, @{Name="LastLogon";Expression={(Get-Date($_.lastLogonTimestamp)).AddYears(1600)}}  | Format-Table 
