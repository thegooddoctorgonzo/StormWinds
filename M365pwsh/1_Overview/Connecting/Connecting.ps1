# https://learn.microsoft.com/en-us/microsoft-365/enterprise/connect-to-microsoft-365-powershell?view=o365-worldwide

# being deprecated in June 2023
Install-Module MSOnline
Install-Module  AzureAD 

Import-Module -Name azuread
Import-Module -Name MSOnline

Connect-AzureAD
Connect-MsolService


# newest modules
Install-Module Microsoft.Graph -Scope AllUsers

Connect-MgGraph -Scopes "*.ReadWrite.All" #"User.ReadWrite.All","Group.ReadWrite.All", "Application.ReadWrite.All"