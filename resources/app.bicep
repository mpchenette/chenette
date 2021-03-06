// =========== app.bicep ===========

param name string
param location string
param isLinux bool
param planId string
@secure()
param clid string
@secure()
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
          value: 'https://crchenetteprod001.azurecr.io'
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
      linuxFxVersion: 'DOCKER|crchenetteprod001.azurecr.io/dotnetwebapp:latest'
    }
  }
}
