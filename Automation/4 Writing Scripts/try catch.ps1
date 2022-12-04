try
{
    Get-Acl -Path .\Fake -ErrorAction Stop
}
catch [System.Management.Automation.ItemNotFoundException]
{
    Write-Host "Divide by zero exception"
}
