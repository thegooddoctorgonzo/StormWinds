$servers = "DNS1","DHCP1",".","127.0.0.1"

#create a new custom object
$objTemplateObject = New-Object -TypeName psobject

$objTemplateObject | Add-Member -MemberType NoteProperty -Name Server -Value $null
$objTemplateObject | Add-Member -MemberType NoteProperty -Name Admins -Value $null

$OSList = New-Object System.Collections.ArrayList

foreach($server in $servers)
{
    #instantiate 1 of those custom objects
    $objTemp = $objTemplateObject | Select-Object *

    #add values to the properties
    $objTemp.Server = $server

    try{
    Invoke-Command -ComputerName $server -ScriptBlock {Get-ComputerInfo -Property WindowsProductName} -OutVariable OSver -EnableNetworkAccess -ErrorAction Stop | Out-Null
    $objTemp.Admins = $OSver | Select-Object -ExpandProperty WindowsProductName
    }
    catch{
        $objTemp.Admins = "UNREACHABLE"
    }


    #add the object to an array
    $OSList.Add($objTemp) | Out-Null
}