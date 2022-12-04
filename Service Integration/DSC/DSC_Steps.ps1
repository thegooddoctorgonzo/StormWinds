Find-Module -Name PSDesiredStateConfiguration | Install-Module -Force

Get-DscResource | Select-Object Name,Module,Properties | Format-Table -AutoSize 

Get-DscResource -Name Environment -Syntax

#Create template .ps1 file with configuration. Run script to create a config file

start-dscConfiguration -Path .\Configs\CreateTestFile\ -Wait -Verbose

Get-DscLocalConfigurationManager