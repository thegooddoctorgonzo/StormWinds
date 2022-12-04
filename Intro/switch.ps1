#$x = 10

$x = Get-Random -Maximum 10

switch ($x) {
    1 { Write "1" }
    2 {Write "2 - 9"}
    Default { Write "something else"}
}