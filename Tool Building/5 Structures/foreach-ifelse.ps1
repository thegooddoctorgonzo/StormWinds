$username = "Josh", "Russ", "Steve"


foreach ($user in $username) {
    if (!(Get-LocalUser -name $user))
    {

        New-LocalUser -Name $user -Password $pw

    }

    Else
    {

        Write-Host "User already exists" 

    }
}