$params = @{
	"Template@odata.bind" = "https://graph.microsoft.com/v1.0/teamsTemplates('educationClass')"
	DisplayName = "My Class Team"
	Description = "My Class Team's Description"
}
New-MgTeam -BodyParameter $params