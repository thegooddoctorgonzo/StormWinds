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

-- Dont import the modules --
#Import-Module -Name Microsoft.Graph