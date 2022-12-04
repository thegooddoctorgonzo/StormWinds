
[String[]]$username = "Josh","Russ","Steve"
$pw = ConvertTo-SecureString -String "sfsdfsd123123" -AsPlainText -Force

foreach ($user in $username)

{

    if(!(Get-LocalUser -name $user))
    {
        New-LocalUser -Name $user -Password $pw
    }

}