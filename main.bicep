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
    clid: '6f8856bb-855f-462b-8c4c-4bfe34cc4d84'
    clse: 'R2W8Q~BmbNj1G_16jA5zfSwUVXOg7GmC1MtuGb3W'
  }
}
