$user = Get-MgUser -all | Where-Object {$_.DisplayName -eq "Bob Smith"}

$skus = Get-MgSubscribedSku -All

$skus.ServicePlans | sort ServicePlanName

$ExSku = $skus.ServicePlans | Where-Object {$_.ServicePlanName -like "*EXCHANGE*"}

#user needs to already have an O365 license assigned

# neither of these work
Set-MgUserLicense -UserId $user.Id -AddLicenses @{SkuId = $ExSku.ServicePlanId} -RemoveLicenses @()

Update-MgUserLicenseDetail -UserId $user.id -LicenseDetailsId $ExSku.ServicePlanId