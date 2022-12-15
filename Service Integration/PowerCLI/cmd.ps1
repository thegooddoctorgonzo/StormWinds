Get-Snapshot -VM VM1

New-Snapshot -VM VM1 -Name 20220101-1200

Show discrepancy between local help and online

Remove-Snapshot -Snapshot <Snapshot Object>

Get-VM  | Get-Snapshot | Where-Object {$_.Created -lt  (Get-Date).AddDays(-14)} | Remove-Snapshot

Get-Snapshot -VM VM1

New-Snapshot -VM VM1 -Name 20220101-1200

Show discrepancy between local help and online

Remove-Snapshot -Snapshot <Snapshot Object>

Get-VM  | Get-Snapshot | Where-Object {$_.Created -lt  (Get-Date).AddDays(-14)} | Remove-Snapshot