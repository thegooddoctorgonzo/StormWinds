$userList = Get-Content -Path .\Users.txt
$targetGroup = "RemoteUsers"

Foreach($user in $userList)
{
    Get-ADUser -Identity $user | Add-ADGroupMember -Identity $targetGroup -Confirm:$false
}

$list = Import-Csv -Path .\1_ActiveDirectory\Groups\UsersAndGroups.csv

Foreach($lineItem in $list)
{
    Get-ADUser -Identity $lineItem.User | Add-ADGroupMember -Identity $lineItem.Group -Confirm:$false
}