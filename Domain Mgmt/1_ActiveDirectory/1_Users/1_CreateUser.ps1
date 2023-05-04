$password = "P@ssword23@#"

New-ADUser -Name "Bob Smith" `
            -DisplayName "Bob Smith" `
            -GivenName "Bob"`
            -Surname "Smith" `
            -SamAccountName "smithb" `
            -UserPrincipalName "smithb@zoneb.com"`
            -Office "R207" `
            -Description "HR Supervisor" `
            -Path "CN=Users,DC=zoneb,DC=com" `
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
    Name = 'Rob Smith'
    DisplayName = 'Rob Smith'
    GivenName = 'Rob'
    Surname = 'Smith'
    SamAccountName = 'smithr'
    UserPrincipalName = 'smithr@zoneb.com'
    Office = 'R207'
    Description = 'HR Supervisor'
    Path = "CN=Users,DC=zoneb,DC=com"
    CannotChangePassword = $false
    PasswordNeverExpires = $false
    AccountPassword = (ConvertTo-SecureString -AsPlainText $password -Force)
}

New-ADUser @userDetails | Enable-ADAccount