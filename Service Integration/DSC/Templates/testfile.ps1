Configuration CreateTestFile_Config
{
    param ()

    Import-DscResource -ModuleName 'PSDscResources'

    Node localhost
    {
        File CreateTestFile
        {
            DestinationPath = "C:\temp\Test.txt"
            Contents = "TESTYEST"
            Ensure = "Present"
        }
    }
}

CreateTestFile_Config -OutputPath:".\DSC\Configs\CreateTestFile"
