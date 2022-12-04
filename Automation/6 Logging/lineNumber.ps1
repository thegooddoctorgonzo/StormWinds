

Function Get-CurrentLine {
    $Myinvocation.ScriptlineNumber
}


$MyInvocation | select *

$lineNum = Get-CurrentLine