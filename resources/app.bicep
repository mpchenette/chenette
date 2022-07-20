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
      alwaysOn: true
      appSettings: [
        {
          name: 'DOCKER_REGISTRY_SERVER_URL'
          value: 'https://mcr.microsoft.com'
        }
        {
          name: 'DOCKER_REGISTRY_SERVER_USERNAME'
          value: 'https://mcr.microsoft.com'
        }
        {
          name: 'DOCKER_REGISTRY_SERVER_PASSWORD'
          value: 'https://mcr.microsoft.com'
        }
      ]
      healthCheckPath: '/' // Change?
      linuxFxVersion: 'DOCKER|mcr.microsoft.com/appsvc/staticsite:latest'
    }
  }
}

{
"name": "DOCKER_REGISTRY_SERVER_USERNAME",
"value": "[parameters('dockerRegistryUsername')]"
},
{
"name": "DOCKER_REGISTRY_SERVER_PASSWORD",
"value": "[parameters('dockerRegistryPassword')]"
}
