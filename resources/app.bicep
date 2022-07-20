// =========== app.bicep ===========

param name string
param location string
param isLinux bool
param planId string
param clid string
param clse string

resource app 'Microsoft.Web/sites@2021-03-01' = {
  name: name
  location: location
  kind: 'app,linux,container'
  properties: {
    httpsOnly: true
    reserved: isLinux
    serverFarmId: planId
    siteConfig: {
      alwaysOn: true
      appSettings: [
        {
          name: 'DOCKER_REGISTRY_SERVER_URL'
          value: 'https://mcr.microsoft.com'
        }
        {
          name: 'DOCKER_REGISTRY_SERVER_USERNAME'
          value: clid
        }
        {
          name: 'DOCKER_REGISTRY_SERVER_PASSWORD'
          value: clse
        }
      ]
      healthCheckPath: '/' // Change?
      linuxFxVersion: 'DOCKER|mcr.microsoft.com/appsvc/staticsite:latest'
    }
  }
}

