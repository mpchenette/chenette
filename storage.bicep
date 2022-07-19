// =========== storage.bicep ===========

// targetScope = 'resourceGroup' - not needed since it is the default value
param location string = resourceGroup().location
param storageAccountName string

resource stg 'Microsoft.Storage/storageAccounts@2021-02-01' = {
  name: storageAccountName
  location: location
  sku: {
    name: 'Standard_LRS'
  }
  kind: 'StorageV2'
}
