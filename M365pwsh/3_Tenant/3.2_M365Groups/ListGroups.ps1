Get-MgGroup

# has to be in the format (double) property comparison (single)value(single)(double)
$itadminsGroup = Get-MgGroup -Filter "DisplayName eq 'SecMail - MadeGroup'"