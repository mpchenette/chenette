// =========== plan.bicep ===========

param name string
param location string
param tier string
param isLinux bool

resource plan 'Microsoft.Web/serverfarms@2021-03-01' = {
  name: name
  location: location
  sku: {
    tier: tier
  }
  properties: {
    reserved: isLinux
  }
}
