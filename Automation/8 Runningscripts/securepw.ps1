#Generate a 32 byte key and save it to a file
$Key = New-Object Byte[] 32
[Security.Cryptography.RNGCryptoServiceProvider]::Create().GetBytes($Key)
$Key | out-file .\USER.key

#Generate a secure string password - and save it to a file
$pw = ConvertTo-SecureString -String "P@ssword" -AsPlainText -Force
$pw | ConvertFrom-SecureString -Key (Get-Content .\USER.key) | Out-File -FilePath .\pw.txt

# during the script run - use the pw file and key file to decrypt and use as plain text
$password = Get-Content .\pw.txt | ConvertTo-SecureString -Key (Get-Content .\USER.key)
$credential = New-Object System.Management.Automation.PsCredential("DOMAIN\USER",$password)

$credential.GetNetworkCredential()