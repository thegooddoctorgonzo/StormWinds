$team = Get-Team -DisplayName HelpDesk

# user to add as a memeber must be licensed for Teams
Remove-TeamUser -GroupId $team.GroupId -User $bob.id