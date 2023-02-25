# create function to move roles
function Move-ADRole {
    [CmdletBinding()]
    param
    (
        $Role,
        $MaxRoles
    )    
        # move role to random DC, that has less than the max roles, and not the current DC
        Move-ADDirectoryServerOperationMasterRole `
            -OperationMasterRole $Role `
            -Identity (Get-ADDomainController -Filter * | Where-Object { $_.OperationMasterRoles.Valuelist.count -lt $MaxRoles -and $_.name -ne $env:COMPUTERNAME} | Select-Object -ExpandProperty Name | Get-Random -Count 1)`
            -Confirm:$false
    }
    
# get-FSMO roles on current DC
Get-ADDomainController -Identity $env:COMPUTERNAME | Select-Object -ExpandProperty OperationMasterRoles | `
ForEach-Object {
    switch ($_)
    {
        # work through each ROLE
        "PDCEmulator" {$Role=0;break}
        "RIDMaster" {$Role=1;break}
        "InfrastructureMaster" {$Role=2;break}
        "SchemaMaster" {$Role=3;break}
        "DomainNamingMaster" {$Role=4;break}
    }
    
    # get number of DCs in domain
    switch (((Get-ADDomainController -Filter *).count) - 1)
    {
        0 {Write-Host "This is not going to work";break}
        1 {
            Move-ADRole -Role $Role -MaxRoles 5
            break
            }
        2 {
            Move-ADRole -Role $Role -MaxRoles 5
            break
            }
        {$_ -in (3,4)} {
                        Move-ADRole -Role $Role -MaxRoles 2
                        break
                        }
        default {
                    Move-ADRole -Role $Role -MaxRoles 1
                }
    }
}