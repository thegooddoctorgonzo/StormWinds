foreach($target in $noPing)
{
    Write-Host -ForegroundColor Green "Working $($target.hostname)"
    Remove-DnsServerResourceRecord -ZoneName zoneb.com -ComputerName DC-ALPHA -Name $target.hostname -RecordData $target.IP -RRType A -Verbose
}