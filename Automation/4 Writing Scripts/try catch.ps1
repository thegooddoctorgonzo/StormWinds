try
{
    Get-Acl -Path .\Fake -ErrorAction Stop
}
catch [System.Management.Automation.ItemNotFoundException]
{
    Write-Host "Item not found exception"
}

try
{
    Resolve-DnsName -Name sdfsfsdfs.com -ErrorAction Stop
}
catch 
{
    Write-Host "DNS name not found exception"
}