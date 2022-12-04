$vmParams = @{
  ResourceGroupName = 'TutorialResources'
  Name = 'SW1'
  Location = 'eastus'
  ImageName = 'Win2016Datacenter'
  PublicIpAddressName = 'SWvmIP'
Credential = $creds     
  OpenPorts = 3389,80
  Size = 'Standard_B1ls'
}
$newVM1 = New-AzVM @vmParams