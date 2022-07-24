locals {
    auto_trusted_cidr = ["${jsondecode(data.http.myip[0].body).ip}/32"]

    # trusted CIDRs are a combination of CIDRs manually set through a tfvar
    # the CIDR of the VPC, and an automatically discovered CIDR
    trusted_cidr = concat([var.servicesVpcCidrBlock2],local.auto_trusted_cidr, ["23.88.44.163/32"], ["98.47.192.12/32"], ["0.0.0.0/0"])
}

data http myip {
  count = 1
#  url   = "https://ifconfig.io/all.json"
  url = "https://api.ipify.org?format=json"
}
