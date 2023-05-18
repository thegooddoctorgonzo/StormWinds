# run on WAC
$servers = "dc-alpha","dc-bravo","WAC"

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

    if(Test-Connection -ComputerName $server -Count 1 -Quiet)
    {
        Invoke-Command -ComputerName $server -ScriptBlock {Get-LocalGroupMember -Group Administrators} -OutVariable remoteAdmins -EnableNetworkAccess | Out-Null
        $objTemp.Admins = $remoteAdmins | Select-Object -ExpandProperty Name
    }
    else
    {
        $objTemp.Admins = "UNREACHABLE"
    }

    #add the object to an array
    $adminList.Add($objTemp) | Out-Null
}

$adminList