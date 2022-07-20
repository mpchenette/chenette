// =========== app.bicep ===========

param name string
param location string
param isLinux bool
param planId string

resource app 'Microsoft.Web/sites@2021-03-01' = {
  name: name
  location: location
  kind: 'app,linux,container'
  properties: {
    httpsOnly: true
    reserved: isLinux
    serverFarmId: planId
    siteConfig: {
      healthCheckPath: '/' // Change?
      linuxFxVersion: 'DOCKER|https://mcr.microsoft.com/appsvc/staticsite:latest'
    }
  }
}
