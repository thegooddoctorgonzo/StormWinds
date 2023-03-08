$steve = Get-MgUser -Filter "DisplayName eq 'Steven Landry'"

$steveOD = Get-MgUserDrive -UserId $steve.id

$steveRoot = Get-MgUserDriveRoot -DriveId $steveOD.id -UserId $steve.Id

