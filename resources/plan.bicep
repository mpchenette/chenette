// =========== plan.bicep ===========

param name string
param location string
param sku string
param isLinux bool

resource plan 'Microsoft.Web/serverfarms@2021-03-01' = {
  name: name
  location: location
  sku: {
    name: sku
  }
  properties: {
    reserved: isLinux
  }
}

output resourceId string = plan.id
