$itadminsGroup = Get-MgGroup -Filter "DisplayName eq 'IT-Admins'"  

New-MgGroupMember -GroupId $itadminsGroup.Id -DirectoryObjectId (Get-MgUser -Filter "startswith(UserPrincipalName, 'BobSmith')").id