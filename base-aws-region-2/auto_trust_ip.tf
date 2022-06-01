locals {
    auto_trusted_cidr = ["${jsondecode(data.http.myip[0].body).ip}/32"]
    # trusted CIDRs are a combination of CIDRs manually set through a tfvar
    # the CIDR of the VPC, and an automatically discovered CIDR
    trusted_cidr = concat([var.servicesVpcCidrBlock2],local.auto_trusted_cidr)
}

data http myip {
  count = 1
  url   = "https://ifconfig.io/all.json"
}