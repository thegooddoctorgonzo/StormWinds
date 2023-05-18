#set vars
$servers = Get-ADComputer -Filter * -Properties OperatingSystem | Where-Object {$_.OperatingSystem -like "*Windows Server*"} | Select-Object -ExpandProperty Name
$expiringCertificates = New-Object System.Collections.ArrayList

#iterate through each server
foreach($server in $servers){
    If(Test-Connection $server -Count 1 -Quiet -ErrorAction SilentlyContinue)
    {
        #collect certs that expire in 30 days from specified issuer
        $certs = Invoke-Command -ComputerName $server -EnableNetworkAccess -ScriptBlock {
            Get-ChildItem cert:\LocalMachine\My -Recurse <#-ExpiringInDays 30#> | Where-Object {$_.Issuer -like "*AZURE*"} | Select-Object PSComputerName,@{Label="ExpDate";Expression={($_.NotAfter).ToShortDateString()}},Issuer,Subject
        }

        if($certs)
        {
            foreach($c in $certs)
            {
            $expiringCertificates.ADD($c)
            }
        }
    }
}


<#
#Generate html for email body
$file = "C:\temp\body.html"
New-Item -Path $file -ItemType File -Force
Add-Content -Path $file -Value "<b>The following certificates are due to expire in less than 30 days:</b><br><br>"

foreach($e in $expiringCertificates)
{
    $name = $e.PSComputerName
    $date = $e.ExpDate
    $issuer = $e.Issuer

    Add-Content -Path $file -Value "System: $name<br>"
    Add-Content -Path $file -Value "Expiration Date: $date<br>"
    Add-Content -Path $file -Value "Issuer: $issuer<br><br>"
}


#Send Alert Email
if($expiringCertificates){
    $body = [System.IO.File]::ReadAllText($file)
    $subject = "Expiring Certificates!!"
    $to = ""
    Send-MailMessage -Body $body -Subject $subject -From "l" -To $to -SmtpServer "SMTPSERVER" -Port 25 -BodyAsHtml
}

Remove-Item -Path $file -Force -ErrorAction SilentlyContinue
#>