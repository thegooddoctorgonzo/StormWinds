$groups = New-Object system.collections.arraylist
$unusedGrp = New-Object system.collections.arraylist

#get a list of AD groups with 1 to 10 members
foreach($grp in (Get-ADGroup -SearchBase (Get-ADDomain).distinguishedname -Filter * -ResultSetSize 2000 | Where-Object {($_ | Get-ADGroupMember).count -lt 10 -and ($_ | Get-ADGroupMember).count -gt 0}))
{
    $groups.add($grp) | Out-Null
}

#work through each group in list
foreach($group in $groups)
{
    $members = $group | Get-ADGroupMember 
    $flag = $true

    #check the group for members that have never logged in or no log in in 90 days
    foreach($member in $members)
    {
        if($null -eq $member.lastLogonTimestamp -or ((Get-Date($user.lastLogonTimestamp)).AddYears(1600) -gt (Get-date).AddDays(-90)))
        {
            $flag = $false
        }
    }
    if($flag)
    {
        $unusedGrp.Add($group) | Out-Null
    }
}
