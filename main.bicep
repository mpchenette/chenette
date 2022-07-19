// param webAppName string = uniqueString(resourceGroup().id) // Generate unique String for web app name
// param sku string = 'S1' // The SKU of App Service Plan
// param linuxFxVersion string = 'node|14-lts' // The runtime stack of web app
// param location string = resourceGroup().location // Location for all resources
// param repositoryUrl string = 'https://github.com/Azure-Samples/nodejs-docs-hello-world'
// param branch string = 'master'
// var appServicePlanName = toLower('AppServicePlan-${webAppName}')
// var webSiteName = toLower('wapp-${webAppName}')
// resource appServicePlan 'Microsoft.Web/serverfarms@2020-06-01' = {
//   name: appServicePlanName
//   location: location
//   properties: {
//     reserved: true
//   }
//   sku: {
//     name: sku
//   }
//   kind: 'linux'
// }
// resource appService 'Microsoft.Web/sites@2020-06-01' = {
//   name: webSiteName
//   location: location
//   properties: {
//     serverFarmId: appServicePlan.id
//     siteConfig: {
//       linuxFxVersion: linuxFxVersion
//     }
//   }
// }
// resource srcControls 'Microsoft.Web/sites/sourcecontrols@2021-01-01' = {
//   name: '${appService.name}/web'
//   properties: {
//     repoUrl: repositoryUrl
//     branch: branch
//     isManualIntegration: true
//   }
// }

// =========== main.bicep ===========
targetScope = 'subscription'
param location string = 'westus2'

resource rg 'Microsoft.Resources/resourceGroups@2021-01-01' = {
  name: 'rg-contoso2'
  location: location
}

// Deploying storage account using module
module stg 'storage.bicep' = {
  name: 'storageDeployment'
  scope: rg // Deployed in the scope of resource group we created above
  params: {
    location: location
    storageAccountName: 'stcontosomcpusababe'
  }
}
