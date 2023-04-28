$userPropertiesHash = Get-Content .\2_UserAccounts\UserImportList.json | ConvertFrom-Json -AsHashtable

$PasswordProfile = @{
    ForceChangePasswordNextSignIn = $true
    Password = 'P@Ssword123!@#'
    }

New-MgUser @userPropertiesHash -PasswordProfile $PasswordProfile  -AccountEnabled 
