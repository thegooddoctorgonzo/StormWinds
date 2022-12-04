#Set-AzVMRunCommand -ResourceGroupName "sw1" -VMName "swvm1" -Location "EastUS" -RunCommandName "RunCommandName" –SourceScript "Get-Process"

Invoke-AzVMRunCommand -VMName SWVM1 -ResourceGroupName SW1 -CommandId RunPowerShellScript -ScriptPath .\Scripts\getProcess.ps1 