$servers = "DNS1","DHCP1",".","127.0.0.1"

#create the new object
$objTemplateObject = New-Object -TypeName psobject

$objTemplateObject | Add-Member -MemberType NoteProperty -Name Server -Value $null
$objTemplateObject | Add-Member -MemberType NoteProperty -Name Admins -Value $null

$adminList = New-Object System.Collections.ArrayList

foreach($server in $servers)
{
    #instantiate 1 of those objects
    $objTemp = $objTemplateObject | Select-Object *

    #add values to the properties
    $objTemp.Server = $server

    try{
    Invoke-Command -ComputerName $server -ScriptBlock {Get-LocalGroupMember -Group Administrators} -OutVariable remoteAdmins -EnableNetworkAccess -ErrorAction Stop | Out-Null
    $objTemp.Admins = $remoteAdmins | Select-Object -ExpandProperty Name
    }
    catch{
        $objTemp.Admins = "UNREACHABLE"
    }


    #add the object to an array
    $adminList.Add($objTemp) | Out-Null
}