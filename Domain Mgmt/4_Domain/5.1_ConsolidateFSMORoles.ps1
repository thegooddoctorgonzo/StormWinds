# FSMO roles can be moved automatically druing maintenance
# probably want to verify the DC is up and responding first

Move-ADDirectoryServerOperationMasterRole -Identity dc-alpha -OperationMasterRole DomainNamingMaster,InfrastructureMaster,PDCEmulator,RIDMaster,SchemaMaster