#set all profile to same file

#module import
Import-Module posh-git -Verbose
Import-Module vmware.powercli -Verbose

#powercli
Set-PowerCLIConfiguration -WebOperationTimeoutSeconds 99999 -Scope AllUsers -Confirm:$false -Verbose

#env:path
$env:Path = $env:Path + ";C:\Program Files (x86)\Notepad++"
$env:Path = $env:Path + ";C:\ProgramData\chocolatey"

#new aliases
New-Alias -Name "np" -Value "notepad++" -Verbose

#change working dir
Set-Location -Path c:\Code

#shorten prompt path to last folder name
Function prompt {"PS " + ((Get-Location).Path.Split("\") | Select-Object -Last 2)[0] + "/" + ((Get-Location).Path.Split("\") | Select-Object -Last 1) + "> "}

#variables
$date = Get-Date

# Chocolatey profile
$ChocolateyProfile = "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
if (Test-Path($ChocolateyProfile)) {
  Import-Module "$ChocolateyProfile"
}
