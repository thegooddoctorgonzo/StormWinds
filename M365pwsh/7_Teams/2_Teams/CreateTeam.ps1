$params = @{
	"Template@odata.bind" = "https://graph.microsoft.com/v1.0/teamsTemplates('educationClass')"
	DisplayName = "HelpDesk"
	Description = "Tier 1 Help Desk"

}
New-MgTeam -BodyParameter $params

# Creator account become the Teams OWNER unless otherwise specified in cmdlet