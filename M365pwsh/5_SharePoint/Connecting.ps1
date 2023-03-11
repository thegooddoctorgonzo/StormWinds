#start SPOnline Management console
Connect-SPOService -Url https://landrypwshtraining-admin.sharepoint.com/

$site = Get-SPOSite -Filter 'Url -eq "https://landrypwshtraining.sharepoint.com/"'

Get-SPOUser -Site $site

