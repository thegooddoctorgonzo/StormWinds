$team = Get-Team -DisplayName HelpDesk

# user to add as a memeber must be licensed for Teams
Add-TeamUser -GroupId $team.GroupId -User $user.DisplayName