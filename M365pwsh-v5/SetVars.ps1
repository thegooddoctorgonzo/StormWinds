$bob = Get-MgUser -all | Where-Object {$_.DisplayName -eq "Bob Smith"}

$steve = Get-MgUser -all | Where-Object {$_.DisplayName -eq "Steven Landry"}

$rob = Get-MgUser -all | Where-Object {$_.DisplayName -eq "Rob Smith"}

$testUser = Get-MgUser -all | Where-Object {$_.DisplayName -eq "Test User"}