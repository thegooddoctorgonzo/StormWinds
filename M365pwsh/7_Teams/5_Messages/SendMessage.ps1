$teams = Get-Team

foreach($team in $teams)
{
    $channel = Get-MgTeamChannel -TeamId $team.GroupId | Where-Object {$_.DisplayName -eq "Weather Announcements"}
    New-MgTeamChannelMessage -TeamId $team.GroupId -ChannelId $channel.Id -Body @{ Content="TESTING" }
}

