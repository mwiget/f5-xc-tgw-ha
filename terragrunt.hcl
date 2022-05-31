terraform {
    extra_arguments "volterra" {
        commands = ["apply","plan","destroy"]
        arguments = []
    }
}

inputs = {
    projectPrefix          = "mwha"
    namespace              = "mwha"
    volterraTenant         = "playground"
    volterraCloudCredAWS   = "mw-aws-f5"
    # these values are also hardcoded as AZs in base-aws-network variables file

    awsRegion1    = "eu-north-1"
    servicesVpcCidrBlock1 = "100.64.0.0/20"
    servicesVpc1  = {
      "azs" = {
        "az1" = { az = "eu-north-1a" },
        "az2" = { az = "eu-north-1b" },
        "az3" = { az = "eu-north-1c" },
      },
      "external" = {
        "az1" = {
          cidr = "100.64.0.0/24"
        },
        "az2" = {
          cidr = "100.64.3.0/24"
        },
        "az3" = {
          cidr = "100.64.6.0/24"
        }
      },
      "internal" = {
        "az1" = {
          cidr = "100.64.1.0/24"
        },
        "az2" = {
          cidr = "100.64.4.0/24"
        },
        "az3" = {
          cidr = "100.64.7.0/24"
        }
      },
      "workload" = {
        "az1" = {
          cidr = "100.64.2.0/24"
        },
        "az2" = {
          cidr = "100.64.5.0/24"
        },
        "az3" = {
          cidr = "100.64.8.0/24"
        }
      }
    }

    spokeVpcCidrBlock1 = "10.0.0.0/20"
    spokeVpc1  = {
      "azs" = {
        "az1" = { az = "eu-north-1a" },
        "az2" = { az = "eu-north-1b" },
        "az3" = { az = "eu-north-1c" },
      },
      "external" = {
        "az1" = {
          cidr = "10.0.0.0/24"
        },
        "az2" = {
          cidr = "10.0.3.0/24"
        },
        "az3" = {
          cidr = "10.0.6.0/24"
        }
      },
      "workload" = {
        "az1" = {
          cidr = "10.0.2.0/24"
        },
        "az2" = {
          cidr = "10.0.5.0/24"
        },
        "az3" = {
          cidr = "10.0.8.0/24"
        }
      }
    }

    # this key name must already exist in AWS region
    # only used for AWS sites
    ssh_key                = "mwiget-ed25519"
    # ssh key value
    ssh_public_key       = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDr1zH+NmWzf/+qtCTqC/+QAHoWIoq3k3YjH/IsjYdHXZ0mQonsMlrL+owArvLtvi3gXxqPGlO/aWt53v8KAY+RV7IOSbqfFY56k0GTmvPJisSsBkAedruu05hqlFMS/2mkNFL/BsWNzL617LtuFQpN6ud57QSrQruQQtIKTuWUe+XjqkSNiAkvD4zc4tip9ovULhC9QY/IVmhguVDJ0FuQWCDd4l7IM+KjlTXGplN5Y9bIVuU+nnSHnUEkRFxuGX1pvOHB1L31INlD9CVJHDA6bBJyIQgv0WcqoA2/3/8eRqN/pXOe+clglJGRT6bb/+5Sfy6JZoA0OlsyW66VfGR3 mwiget@xeon"
}
