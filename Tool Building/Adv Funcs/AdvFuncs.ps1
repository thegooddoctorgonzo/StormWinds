function Get-advanced {
    param (
       [string[]]$SomeInput
    )
   begin {
        'Begin -- this is ran once at the beginning'
    }
    process {
        foreach($input in $SomeInput)
        {
        "Process -- This is ran at every input received - $someinput"
        }
    }
    end {
        'End -- This is ran once at the end'
    }
}

function Verb-Noun {
    [CmdletBinding()]
    param (
        
    )
    
    begin {
        
    }
    
    process {
        
    }
    
    end {
        
    }
}