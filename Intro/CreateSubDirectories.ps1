$path = Get-Item "C:\Temp"

$newDirs = "Dev", "Test", "Prod"

foreach($newDir in $newDirs)
{
    New-Item -Path $path -Name $newDir -ItemType Directory
}