#monitor web site status
Invoke-WebRequest -Uri google.com

#send messages
Send-MailMessage -SmtpServer mail.server -Subject "Alert"