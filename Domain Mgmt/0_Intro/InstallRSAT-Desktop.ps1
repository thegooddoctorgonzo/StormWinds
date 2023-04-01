New-Item -Path HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU
Set-ItemProperty -Path HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate -Name WUServer -Value ""
Set-ItemProperty -Path HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate -Name WUStatusServer -Value ""
Set-ItemProperty -Path HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU -Name UseWUServer -Value 0
Set-ItemProperty -Path HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate -Name DoNotConnectToWindowsUpdateInternetLocations -Value 0

Restart-Service -Name wuauserv -Confirm:$false

$RSATtools = "RSAT.ActiveDirectory*","RSAT.BitLocker*","RSAT.Certificate*","RSAT.DHCP*","RSAT.DNS*","RSAT.FileServices*","RSAT.GroupPolicy*","RSAT.RemoteAccess*","RSAT.RemoteDesktop*","RSAT.ServerManager*","RSAT.WSUS*"
foreach($RSAT in $RSATtools)
{
    Get-WindowsCapability -Name $RSAT -Online | Add-WindowsCapability -Online
}

Set-Service -Name wuauserv -StartupType Automatic -Status Stopped

#Fix WSUS settings
Set-ItemProperty -Path HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate -Name WUServer -Value "http://WSUS:8530"
Set-ItemProperty -Path HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate -Name WUStatusServer -Value "http://WSUS:8530"
Set-ItemProperty -Path HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU -Name UseWUServer -Value 1
Set-ItemProperty -Path HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate -Name DoNotConnectToWindowsUpdateInternetLocations -Value 1
New-ItemProperty -Path HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate -Name TargetGroupEnabled -Value 1 -PropertyType DWord

#turn on UAC
Set-ItemProperty -Path HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System -Name EnableLUA -Value 1


#turn on update service
Set-Service -Name wuauserv -StartupType Automatic -Status Running