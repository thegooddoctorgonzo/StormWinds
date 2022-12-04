function Invoke-Addition{
    [CmdletBinding()]
    param (
        [int]$num1,
        [int]$num2
    )
    
    $num3 = $num1 = $num2

    #output a string for user consumption
   Write-Output "Number is $num3"

    #output a string for cmdlet consumption
   Write-Host "Number is $num3"

    #assign to a variable
   return $num3

}