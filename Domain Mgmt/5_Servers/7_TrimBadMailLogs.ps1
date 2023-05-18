#Steve Landry
#20201211
#Delete mail logs from badmail in SMTP server
#Deletes files older than 7 days

$date = (Get-date).addDays(-7)
$files = Get-ChildItem -Path 'c:\inetpub\mailroot\badmail\' | Where-Object {$_.LastWriteTime -lt $date}

$files | Remove-Item -Confirm:$false -ErrorAction SilentlyContinue -InformationAction SilentlyContinue -WarningAction SilentlyContinue -Verbose

