# collect badmail files
$files = Get-ChildItem -Path .\5_Servers\ | Where-Object {$_.Name -like "*.bad"}

#create array for email addresses
$ToFromList = New-Object System.Collections.ArrayList

# work each file
foreach($file in $files)
{
    # header for the info we're looking for
    $lineNum = Get-Content -Path $file.fullname | Select-String -Pattern "Content-Type: message/rfc822" | Select-Object -ExpandProperty LineNumber

    # if that line exists in file
    if($lineNum)
    {
        # collect email addresses from To and FROM fields
        $ToLines = Get-Content -Path $file.FullName | Select-String -Pattern "To: " | Where-Object {$_.lineNumber -gt $lineNum -and $_ -notlike ("In-reply-to: *","Reply-To: ","Delivered-To: ")}
        $FromLines = Get-Content -Path $file.FullName | Select-String -Pattern "From: " | Where-Object {$_.lineNumber -gt $lineNum}

        #add those all to 1 list
        foreach($ToLine in $ToLines)
        {
            $ToFromList.Add($ToLine) | Out-Null
        }

        foreach($FromLine in $FromLines)
        {
            $ToFromList.Add($FromLine) | Out-Null
        }
    }
}