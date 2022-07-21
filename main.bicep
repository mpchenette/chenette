// =========== main.bicep ===========

targetScope = 'subscription'
param location string = deployment().location

resource rg 'Microsoft.Resources/resourceGroups@2021-01-01' = {
  name: 'rg-chenette-prod-001'
  location: location
}

module cr 'resources/cr.bicep' = {
  name: 'crDeployment'
  scope: rg
  params: {
    name: 'crchenetteprod001'
    location: rg.location
    sku: 'Standard'
  }
}

// module kv 'resources/kv.bicep' = {
//   name: 'kvDeployment'
//   scope: rg
//   params: {
//     name: 'kv-chenette-prod-scus-001'
//     location: rg.location
//     cr: cr.outputs.resource
//   }
// }

module plan 'resources/plan.bicep' = {
  name: 'planDeployment'
  scope: rg
  params: {
    name: 'plan-chenette-prod-scus-001'
    location: rg.location
    sku: 'S1'
    isLinux: true
  }
}

module app 'resources/app.bicep' = {
  name: 'appDeployment'
  scope: rg
  params: {
    name: 'app-chenette-prod-scus-001'
    location: rg.location
    isLinux: true
    planId: plan.outputs.resourceId
    clid: 'crchenetteprod001'
    clse: 'xaPe8evM1DURYb25lYYrwOy0xOyH1x=J'
  }
}
