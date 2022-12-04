function Get-advanced {
    param (
        $SomeInput
    )
    begin {
        'Begin -- this is ran once at the beginning'
    }
    process {
        foreach($input in $SomeInput)
        {
            "Process -- This is ran for each object - $input"
        }
    }
    end {
                'End -- This is ran once at the end'
    }
}