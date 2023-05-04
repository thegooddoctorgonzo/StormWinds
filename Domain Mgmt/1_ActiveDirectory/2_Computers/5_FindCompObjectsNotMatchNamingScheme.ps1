$comps = Get-ADComputer -Filter * -SearchBase "DC=zoneb,DC=com" -Properties * | Where-Object {($_.Name -notlike "?-???????") -and $_.DistinguishedName -notlike "*Virtual*"}

$comps | Select-Object -Property name