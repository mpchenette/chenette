// =========== site.bicep ===========

param name string
param location string
param isLinux bool
param planId string

resource app 'Microsoft.Web/sites@2021-03-01' = {
  name: name
  location: location
  properties: {
    httpsOnly: true
    reserved: isLinux
    serverFarmId: planId
    siteConfig: {
      healthCheckPath: '/' // Change?
    }
  }
}
