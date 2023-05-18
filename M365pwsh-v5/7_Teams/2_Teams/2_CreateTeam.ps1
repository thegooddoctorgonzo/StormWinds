 # show a list of available templates
 Get-CsTeamTemplateList

 New-Team -DisplayName TestTeam -Description

$params = @{
	
	"Template@odata.bind" = "https://graph.microsoft.com/v1.0/teamsTemplates('com.microsoft.teams.template.OnboardEmployees')"
	DisplayName = "NewEmployees"
	Description = "Fresh Fish"

}
New-MgTeam -BodyParameter $params

$params = @{
	
	"Template@odata.bind" = "https://graph.microsoft.com/v1.0/teamsTemplates('com.microsoft.teams.template.OrganizeHelpDesk)"
	DisplayName = "HelpDesk"
	Description = "Working Tickets"

}
New-MgTeam -BodyParameter $params

# Creator account become the Teams OWNER unless otherwise specified in cmdlet