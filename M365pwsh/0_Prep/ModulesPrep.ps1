# install modules 

#graph
Install-Module Microsoft.Graph -Scope AllUsers
#SharePoint Online Management Shell
# Installs a separate application that can be run from its dedicated POSH console or imported into a current session
https://www.microsoft.com/en-us/download/details.aspx?id=35588
#exchange
Install-Module ExchangeOnlineManagement -Scope AllUsers
#azureAD
Install-Module  AzureAD 
# MSOnline
Install-Module MSOnline
# teams
Install-Module -name MicrosoftTeams

#import modules in 5 and 7

#graph
Import-Module Microsoft.Graph -Scope Global
#SharePoint Online Management Shell
Import-Module Microsoft.Online.SharePoint.PowerShell
#exchange
Import-Module ExchangeOnlineManagement -Scope Global
#azureAD
Import-Module  AzureAD 
# MSOnline
Import-Module MSOnline
# teams
Import-Module -name MicrosoftTeams
