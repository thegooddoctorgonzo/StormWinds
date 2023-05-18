# New Channels take a few minutes to show in the Admin console

$teams = Get-Team

foreach($team in $teams)
{
    New-TeamChannel -GroupId $team.GroupId -DisplayName "Weather Announcements" -Description "Incoming Weather" -MembershipType Standard
}