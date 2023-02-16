$groups = New-Object system.collections.arraylist
$removeGrp = New-Object system.collections.arraylist
foreach($grp in (Get-ADGroup -SearchBase (Get-ADDomain).distinguishedname -Filter * -ResultSetSize 2000 | Where-Object {($_ | Get-ADGroupMember).count -lt 10 -and ($_ | Get-ADGroupMember).count -gt 0}))
{
    $groups.add($grp) | Out-Null
}

foreach($group in $groups)
{
    $members = $group | Get-ADGroupMember 
    $flag = $true
    

    foreach($member in $members)
    {
        if($member.lastLogonTimestamp -eq $null -or ((Get-Date($user.lastLogonTimestamp)).AddYears(1600) -gt (Get-date).AddDays(-90)))
        {
            $flag = $false
        }
    }
    if($flag)
    {
        $removeGrp.Add($group) | Out-Null
    }
}
