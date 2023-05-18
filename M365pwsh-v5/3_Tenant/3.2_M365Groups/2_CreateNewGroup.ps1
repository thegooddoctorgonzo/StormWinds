# Security Group
New-MgGroup -DisplayName 'Security - Test Group' -MailEnabled:$False  -MailNickName 'security-testgroup' -SecurityEnabled

# Mail Enabled security group - seems to not be an option
# Bug in how this command is expected to work - MailEnabled and SecurityEnabled are bools that should be switches.
# https://github.com/microsoftgraph/msgraph-sdk-powershell/issues/748
$prop = @{}
$prop["mailEnabled"] = $true
New-MgGroup -DisplayName 'SecurityMail - Test Group' -MailNickName 'securitymail-testgroup'  -AdditionalProperties $prop -SecurityEnabled

