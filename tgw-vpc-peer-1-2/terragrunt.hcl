include "root" {
  path = find_in_parent_folders()
}

dependencies {
  paths = ["../base-aws-region-1", "../base-aws-region-2"]
}

dependency "infrastructure1" {
  config_path = "../base-aws-region-1"
  mock_outputs = {
    awsAz1 = ""
    awsAz2 = ""
    awsAz3 = ""
    "externalSubnets" = {
      "az1" = {
        "id" = "1"
      }
    }
    internalSubnets = {
      "az1" = {
        "id" = "1"
      }
    }
    workloadSubnets = {
      "az1" = {
        "id" = "1"
      }
    }
    spokeExternalSubnets = {
      "az1" = {
        "id" = "1"
      }
    }
    spokeExternalSubnets = {
      "az1" = {
        "id" = "1"
      }
    }
    spokeWorkloadSubnets = {
      "az1" = {
        "id" = "1"
      }
    }
    securityGroup = ""
    vpcId = ""
    spokeVpcId = ""
    spoke2VpcId = ""
    serviceCidrBlock = "0.0.0.0/0"
    serviceExternalRouteTable = ""
    spokeSecurityGroup = ""
  }
}

dependency "infrastructure2" {
  config_path = "../base-aws-region-2"
  mock_outputs = {
    vpcId = ""
    serviceExternalRouteTable = ""
    serviceCidrBlock = "0.0.0.0/0"
  }
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
    spokeVpcId           = dependency.infrastructure1.outputs.spokeVpcId
    spokeSecurityGroup   = dependency.infrastructure1.outputs.spokeSecurityGroup
    serviceExternalRouteTable = dependency.infrastructure1.outputs.serviceExternalRouteTable
    serviceCidrBlock          =  dependency.infrastructure1.outputs.serviceCidrBlock

    vpcId2                     = dependency.infrastructure2.outputs.vpcId
    serviceExternalRouteTable2 = dependency.infrastructure2.outputs.serviceExternalRouteTable
    serviceCidrBlock2          = dependency.infrastructure2.outputs.serviceCidrBlock
}

