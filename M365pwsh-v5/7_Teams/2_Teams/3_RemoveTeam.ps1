$team_posh = Get-Team -DisplayName HelpDesk

Remove-Team -GroupId $team_posh.GroupId -Verbose