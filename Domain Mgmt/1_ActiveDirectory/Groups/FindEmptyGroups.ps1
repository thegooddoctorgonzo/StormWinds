$emptyGroups = New-Object system.collections.arraylist

foreach($grp in (Get-ADGroup -SearchBase (Get-ADDomain).distinguishedname -Filter * -ResultSetSize 2000 | Where-Object {($_ | Get-ADGroupMember).count -eq 0}))
{
    $emptyGroups.add($grp) | Out-Null
}