output projectPrefix {
  value = var.projectPrefix
}
output awsRegion1 {
  value = var.awsRegion1
}
output awsAz1 {
  value = var.servicesVpc1.azs["az1"]["az"]
}
output awsAz2 {
  value = var.servicesVpc1.azs["az2"]["az"]
}
output awsAz3 {
  value = var.servicesVpc1.azs["az3"]["az"]
}
output externalSubnets {
  value = aws_subnet.f5-xc-services-external
}
output internalSubnets {
  value = aws_subnet.f5-xc-services-internal
}
output workloadSubnets {
  value = aws_subnet.f5-xc-services-workload
}
output securityGroup {
  value   = aws_security_group.f5-xc-vpc.id
}
output vpcId {
  value = aws_vpc.f5-xc-services.id
}
output spokeVpcId{
  value = aws_vpc.f5-xc-spoke.id
}
output spokeSecurityGroup {
  value = aws_security_group.f5-xc-spoke-vpc.id
}

output serviceExternalRouteTable {
  value = aws_route_table.f5-xc-services-vpc-external-rt.id
}

output serviceCidrBlock {
  value = var.servicesVpcCidrBlock1
}
