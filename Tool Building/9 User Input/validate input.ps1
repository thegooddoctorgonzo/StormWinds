function FunctionName {
    param (
        [string]$filepath
    )
    
    ########
    try{
        Get-Item -Path $filepath
    }
    catch{
        exit
    }

    ###########
    if(Get-Item -Path $filepath)
    {
        Write-Host "File path is good"
    }
    else
    {
        $filepath = Read-Host -Prompt "Enter path again"
    }

    ################
    if(!(Get-Item -Path $filepath))
    {
        Write-Host "File path is bad"
        exit
    }
    
    
}