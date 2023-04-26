$user = Get-MgUser -Filter "DisplayName eq 'Steven Landry'"

$OBE_Sku = Get-MgSubscribedSku -All | Where-Object SkuPartNumber -eq 'O365_BUSINESS_ESSENTIALS'

Set-MgUserLicense -UserId $user.Id -AddLicenses @{SkuId = $OBE_Sku.SkuId} -RemoveLicenses @()