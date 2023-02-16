$userList = Get-Content -Path .\Users.txt

Foreach($user in $userList)
{
    Get-ADUser -Identity $user | Add-ADGroupMember -Identity $targetGroup -Confirm:$false
}
