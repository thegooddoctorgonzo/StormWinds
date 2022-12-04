(get-azvmsize -Location westus3).count

get-azvmsize -Location westus3  | Where-Object {$_.name -like "*_B*" -and $_.NumberOfCores -eq 1}