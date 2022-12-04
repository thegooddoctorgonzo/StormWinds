Get-AzVMImagePublisher -Location eastus | Select-Object PublisherName
Get-AzVMImageOffer -Location eastus -PublisherName MicrosoftWindowsServer
Get-AzVMImageSKU -PublisherName MicrosoftWindowsServer -Offer WindowsServer -Location eastus
$image = Get-AzVMImage -PublisherName MicrosoftWindowsServer -Offer WindowsServer -Location eastus -Skus "2022-datacenter-g2" -top 1
