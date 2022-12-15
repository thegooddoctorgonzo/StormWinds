Invoke-AzVMRunCommand -VMName SWVM1 -ResourceGroupName SW1 -CommandId RunPowerShellScript -ScriptPath .\Scripts\getInstalledFeatures.ps1 -OutVariable output​

Invoke-AzVMRunCommand -VMName SWVM1 -ResourceGroupName SW1 -CommandId RunPowerShellScript -ScriptPath .\Scripts\InstallFeatures.ps1 -OutVariable output    