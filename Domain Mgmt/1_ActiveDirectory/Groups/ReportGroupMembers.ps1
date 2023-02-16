$targetGroup = Get-ADGroup -Identity "ProfileUnity-Default"

$users = Get-ADGroupMember -Identity $targetGroup | Get-ADUser