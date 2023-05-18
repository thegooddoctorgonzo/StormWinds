#count the type and number of licensing applied

$users = Get-MgUser -All
$userLic = New-Object System.Collections.ArrayList

foreach($user in $users)
{
    foreach($lic in ((Get-MgUserLicenseDetail -UserId $user.Id).ServicePlans | Where-Object {$_.ProvisioningStatus -ne "Disabled"} | Select-Object -ExpandProperty ServicePlanName))
    {
        $userLic.add($lic) | Out-Null
    }
}

$userLic | Group-Object | Select-Object Count,Name | Sort-Object -Descending Count
