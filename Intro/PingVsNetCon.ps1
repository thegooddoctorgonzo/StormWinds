ping dns.google

Test-NetConnection -ComputerName dns.google-Verbose

$reply = Test-NetConnection -ComputerName dns.google -Verbose

$reply | select remoteaddress,pingsucceeded