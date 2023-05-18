$list = Import-Csv -Path .\ServersServices.csv 


foreach($server in $list)
{
    # Using a try/catch block to get whether the service exists
    try{
        Get-Service -ComputerName $server.server -Name $server.Service -ErrorAction stop | out-null
        Write-Host "$($server.Server) - $($server.Service) -- SERVICE EXISTS" -ForegroundColor Green
    }
    catch{
        Write-Host "$($server.Server) - $($server.Service) -- SERVICE UNAVAILABLE" -ForegroundColor Red
    }


    # Using an IF Block to get status
    if((Get-Service -ComputerName $server.server -Name $server.Service -ErrorAction SilentlyContinue).status -ne "Running")
    {
        Write-Host "$($server.Server) - $($server.Service) -- SERVICE DOWN" -ForegroundColor Red
    }
    else
    {
        Write-Host "$($server.Server) - $($server.Service) -- SERVICE UP" -ForegroundColor Green
    }
}