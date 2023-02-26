#start SPOnline Management console
Connect-SPOService -Url https://landrypwshtraining-admin.sharepoint.com/

Get-SPOUser -Site (Get-SPOSite)[0]

