$list = Import-Csv -Path .\5_Servers\ServersServices.csv 

foreach($server in $list)
{
    <#if(!(Get-Service -ComputerName $server.server -Name $server.Service))
    {
        Write-Host "$($server.Server) - $($server.Service) -- SERVICE DOWN"
    }#>

    try{
        Get-Service -ComputerName $server.server -Name $server.Service -ErrorAction stop
    }
    catch{
        Write-Host "$($server.Server) - $($server.Service) -- SERVICE DOWN"
    }

}