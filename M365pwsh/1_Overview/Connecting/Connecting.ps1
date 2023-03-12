$params = @(
    'User.ReadWrite.All',
    "Group.ReadWrite.All", 
    "Application.ReadWrite.All",
    "Organization.ReadWrite.All",
    "MailboxSettings.ReadWrite",
    "Mail.Send.Shared",
    "Mail.ReadWrite.Shared",
    "TeamSettings.ReadWrite.All",
    "Files.ReadWrite.All",
    "ReportSettings.ReadWrite.All",
    "Reports.Read.All",
    "Sites.FullControl.All"
)

Connect-MgGraph -Scopes $params