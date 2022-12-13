try {
    Remove-Item -Path .\NoFolder -ErrorAction Stop
}
catch {
    Write-Host "Folder doesnt exist"
}