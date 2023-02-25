$gpos = Get-GPO -All

foreach($gpo in $gpos)
{
    if($gpo.IsAclConsistent())
    {
        Write-Host "$($gpo.DisplayName) - $($gpo.IsAclConsistent())" -ForegroundColor Green
    }
    else
    {
        Write-Host "$($gpo.DisplayName) - $($gpo.IsAclConsistent())" -ForegroundColor Red
    }

}