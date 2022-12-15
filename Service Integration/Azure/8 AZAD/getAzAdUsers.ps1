Get-AzADUser -Filter "Displayname eq 'Tanner'"

Get-AzADUser | Where-Object {$_.UserPrincipalName -like "*outlook*"}

$pw = ConvertTo-SecureString -String "123qwe!@#QWE" -AsPlainText -Force
New-AzADUser -DisplayName user1 -MailNickname user1 -UserPrincipalName "user1@$((Get-AzDomain)[0].domains)" -Password $pw