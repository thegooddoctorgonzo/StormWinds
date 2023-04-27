$team_posh = Get-Team -DisplayName HelpDesk

$team_posh = Get-Team |  Where-Object {$_.displayname -eq "HelpDesk"}

$team_graph = Get-MgTeam -TeamId $team_posh.GroupId