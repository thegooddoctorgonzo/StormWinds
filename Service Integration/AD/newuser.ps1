$NewUserSplat = @{
    firstName= “Matt"
    lastName = “Murdock"
    displayName    = “Daredevil"
    title = “Lawyer"
    department = “Hells Kitchen"
}

New-ADUser @NewUserSplat
