Install-Module -Name vmware.powercli  | Import-Module

Set-PowerCLIConfiguration -InvalidCertificateAction Ignore -ParticipateInCeip $false -DefaultVIServerMode Multiple -WebOperationTimeoutSeconds 9999 -DisplayDeprecationWarnings:$false 