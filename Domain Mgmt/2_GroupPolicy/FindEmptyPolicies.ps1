#collect GPO folders in SYSVOL
$folders = Get-ChildItem -Path \\zoneb.com\SYSVOL\zoneb.com\Policies -Depth 0 | Where-Object {$_.name -like "{*"}

#set array to collect broken GPOs
$EmptyFolders = New-Object System.Collections.ArrayList

# work each folder - check for missing GPT.ini file
foreach($folder in $folders)
{
    if(!(Get-Item -Path "$($folder.FullName)\GPT.ini" -ErrorAction SilentlyContinue))
    {
        $EmptyFolders.add($folder)
    }
}

$EmptyFolders