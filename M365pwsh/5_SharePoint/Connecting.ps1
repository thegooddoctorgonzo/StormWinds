https://www.microsoft.com/en-us/download/details.aspx?id=35588


#start SPOnline Management console
Connect-SPOService -Url https://landrypwshtraining-admin.sharepoint.com/

$site = Get-SPOSite -Filter 'Url -eq "https://landrypwshtraining.sharepoint.com/"'

Get-SPOUser -Site $site

