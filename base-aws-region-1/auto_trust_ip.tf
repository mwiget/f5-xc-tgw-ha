locals {
    auto_trusted_cidr = ["${jsondecode(data.http.myip[0].body).ip}/32"]
    # trusted CIDRs are a combination of CIDRs manually set through a tfvar
    # the CIDR of the VPC, and an automatically discovered CIDR
    trusted_cidr = concat([var.trusted_ip],[var.servicesVpcCidrBlock],local.auto_trusted_cidr)
}

data http myip {
  count = 1
  url   = "https://ifconfig.io/all.json"
}
