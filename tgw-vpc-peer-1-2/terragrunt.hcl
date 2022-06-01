include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = ["../base-aws-region-1"]
}

dependency "infrastructure1" {
  config_path = "../base-aws-region-1"
}
dependency "infrastructure2" {
  config_path = "../base-aws-region-2"
}
inputs = {
    awsAz1               = dependency.infrastructure1.outputs.awsAz1
    awsAz2               = dependency.infrastructure1.outputs.awsAz2
    awsAz3               = dependency.infrastructure1.outputs.awsAz3
    externalSubnets      = dependency.infrastructure1.outputs.externalSubnets
    internalSubnets      = dependency.infrastructure1.outputs.internalSubnets
    workloadSubnets      = dependency.infrastructure1.outputs.workloadSubnets
    spokeExternalSubnets = dependency.infrastructure1.outputs.spokeExternalSubnets
    spokeWorkloadSubnets = dependency.infrastructure1.outputs.spokeWorkloadSubnets
    securityGroup        = dependency.infrastructure1.outputs.securityGroup
    vpcId                = dependency.infrastructure1.outputs.vpcId
    vpcId2               = dependency.infrastructure2.outputs.vpcId
    spokeVpcId           = dependency.infrastructure1.outputs.spokeVpcId
    spokeSecurityGroup   = dependency.infrastructure1.outputs.spokeSecurityGroup
    serviceExternalRouteTable = dependency.infrastructure1.outputs.serviceExternalRouteTable
    serviceExternalRouteTable2 = dependency.infrastructure2.outputs.serviceExternalRouteTable
    serviceCidrBlock          =  dependency.infrastructure1.outputs.serviceCidrBlock
    serviceCidrBlock2          =  dependency.infrastructure2.outputs.serviceCidrBlock
}
