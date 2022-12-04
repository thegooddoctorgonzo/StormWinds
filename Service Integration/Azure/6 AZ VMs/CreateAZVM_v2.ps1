$vmParams = @{
  ResourceGroupName = 'SW1'
  Name = 'SWVM1'
  Location = 'eastus'
  Image = "Win2016Datacenter"
  PublicIpAddressName = 'SWvmIP'
  Credential = $creds     
  OpenPorts = 3389,80
  Size = 'Standard_B2s'
}
$newVM1 = New-AzVM @vmParams