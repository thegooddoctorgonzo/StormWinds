#Steve Landry
#20190705
#Delete DNS log files older than 7 days


#Get DCs
$DCs = Get-ADComputer -SearchBase "OU=Domain Controllers,DC=zoneb,DC=com" -Filter *

#list of log folders
$folders = new-object system.collections.arraylist

#list of DNS servers
foreach($DC in $DCs)
{
    $folders.Add($(Get-Item -Path "\\$($DC.Name)\c$\Windows\System32\dns")) | Out-Null
}

# work each server folder
foreach($folder in $folders)
{
    # remove old dns.log files
    if($files = Get-ChildItem $folder -Depth 0 -Filter *.log | Where-Object {$_.LastWriteTime -lt (Get-date).AddDays(-7)})
    {
        foreach($file in $files)
        {
            $file | Remove-Item  -Confirm:$false -WarningAction SilentlyContinue -ErrorAction SilentlyContinue -InformationAction SilentlyContinue
        }
    }
}

