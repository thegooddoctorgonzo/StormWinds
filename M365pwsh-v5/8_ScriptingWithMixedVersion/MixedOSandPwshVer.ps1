$PSVersionTable

Invoke-Command -ScriptBlock {powershell.exe /noprofile /c Get-Process} -OutVariable poshReturn
Invoke-Command -ScriptBlock {powershell.exe -noexit} -OutVariable poshReturn2

if($PSVersionTable.PSVersion -like "*7*")
{
    Write-Host "Use posh 7 cmdlet"
}
else
{
    Write-Host "Use posh 5 cmdlet"
}


if($PSVersionTable.OS -like "*Linux*")
{
    Write-Host "Get Linux file path"
    # you can also create a SMB connection to mount home to c:
}
else
{
    Write-Host "Get Win file path"
}
