#Author: Steve Landry
#20190130
#Manages backups for GPOs. Paired with a daily task. Creates a daily backup of GPOs - deletes any expired GPOs

Import-Module GroupPolicy

#create temp dir
if(!(Test-Path -Path C:\temp\GPOTemp))
{
    New-Item -Path C:\temp -Name GPOTemp -ItemType Directory
}

#backup all GPOs to temp dir
foreach($gpo in (Get-GPO -All))
{
    Backup-GPO -Guid $gpo.id -Path 'C:\temp\GPOTemp' -Comment (Get-Date -Format yyyyMMdd).ToString()
}


#delete old GPO backups       
foreach($oldGPO in (Get-ChildItem -Path 'c:\GPO_Backups\'))
{
    if($oldGPO.CreationTime -lt (Get-Date).AddDays(-90))
    {
        Remove-Item -Path $oldGPO.FullName -Recurse -Force        
    }    
}

# move new backups to correct dir - remove temp dir
Get-ChildItem -Path C:\temp\GPOTemp | Move-Item -Destination 'c:\GPO_Backups\'
Get-ChildItem -Path C:\temp\GPOTemp | Remove-Item -Recurse

