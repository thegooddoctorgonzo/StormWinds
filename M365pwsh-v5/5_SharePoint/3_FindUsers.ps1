
Get-SPOUser -Site $site

foreach($site in Get-SPOSite)
{
    Get-SPOUser -Site $site
}