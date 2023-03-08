$delGroup = Get-MgGroup -Filter "DisplayName eq 'SecMail - MadeGroup'"

Remove-MgGroup -GroupId $delGroup.Id