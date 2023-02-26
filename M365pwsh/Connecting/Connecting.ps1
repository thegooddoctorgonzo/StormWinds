# https://learn.microsoft.com/en-us/microsoft-365/enterprise/connect-to-microsoft-365-powershell?view=o365-worldwide

Install-Module MSOnline
Install-Module  AzureAD 

Import-Module -Name azuread
Import-Module -Name MSOnline

Connect-AzureAD
Connect-MsolService