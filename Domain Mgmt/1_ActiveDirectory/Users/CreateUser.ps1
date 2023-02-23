New-ADUser -Name "Bob Smith" `
            -DisplayName "Bob Smith" `
            -GivenName "Bob"`
            -Surname "Smith" `
            -SamAccountName "smithb" `
            -UserPrincipalName "smithb@DOMAIN"`
            -Office "R207" `
            -Description "HR Supervisor" `
            -Path "OU=Users" `
            -CannotChangePassword $false `
            -PasswordNeverExpires $false `
            -AccountPassword (ConvertTo-SecureString -AsPlainText $password -Force) -PassThru | Enable-ADAccount



New-ADUser -Name $DisplayName `
            -DisplayName $DisplayName `
            -GivenName $GivenName `
            -Surname $Surname `
            -SamAccountName $SAM `
            -UserPrincipalName $UPN `
            -Office $Office `
            -Description "$SessionTitle  -  $StartDate" `
            -Path "OU=$ClassType,$OU" `
            -CannotChangePassword $false `
            -PasswordNeverExpires $false `
            -AccountPassword (ConvertTo-SecureString -AsPlainText $password -Force) -PassThru | Enable-ADAccount

$userDetails = @{
    Name = "Bob Smith"
    DisplayName = "Bob Smith"
    GivenName = "Bob"
    Surname = "Smith"
    SamAccountName = "smithb"
    UserPrincipalName = "smithb@DOMAIN"
    Office = "R207"
    Description = "HR Supervisor"
    Path = "OU=Users"
    CannotChangePassword = $false
    PasswordNeverExpires = $false
    AccountPassword = (ConvertTo-SecureString -AsPlainText $password -Force)
}

New-ADUser $userDetails