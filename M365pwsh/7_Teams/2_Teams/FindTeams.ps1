$team_posh = Get-Team -DisplayName HelpDesk

$team_graph = Get-MgTeam -TeamId $team_posh.GroupId