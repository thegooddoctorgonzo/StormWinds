$targetGroup = Get-ADGroup -Identity "RemoteUsers"

$users = Get-ADGroupMember -Identity $targetGroup | Get-ADUser