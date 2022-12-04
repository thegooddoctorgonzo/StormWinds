Configuration RegTest_Config
{
    param ()

    Import-DscResource -ModuleName 'PSDscResources'

    Node localhost
    {
        Registry RegTest
        {
            Key = "HKLM:\SYSTEM\TEST\DELETEME"
            ValueName = "deleteme"
            Ensure = "Present"
            ValueType = "String"
            ValueData = "true"
            Force = $true
        }
    }
}

RegTest_Config -OutputPath:".\DSC\Configs\RegTest"