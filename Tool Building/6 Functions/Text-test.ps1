function Text-test {
    [CmdletBinding()]
    param (
        $VarOne = (Read-Host -Prompt "enter value"),
        [string]$Text,
        [string]$Text2 = "Text #2"
    )
    Write-Host $text
    Write-Host $text2
    $varOne.gettype()
}

#values can be assigned in multiple ways, but avoid complication. Dont set values of parameters in the param section using cmdlets. 
#Leave them unassigned and assign later using logic in the "BEGIN" section of the function