$PasswordProfile = @{
    Password = 'P@Ssword123!@#'
    }
New-MgUser -DisplayName 'Rob Smith' -PasswordProfile $PasswordProfile  -AccountEnabled -MailNickName 'RobSmith' -UserPrincipalName 'RobSmith@LandrypwshTraining.onmicrosoft.com'
