variable "buildSuffix" {
  type        = string
  default     = null
  description = "random build suffix for resources"
}
variable "projectPrefix" {
  type        = string
  description = "projectPrefix name for tagging"
}

variable "awsRegion2" {
  description = "aws region 2"
  type        = string
}

variable "awsAz1" {
  description = "Availability zone, will dynamically choose one if left empty"
  type        = string
  default     = null
}
variable "awsAz2" {
  description = "Availability zone, will dynamically choose one if left empty"
  type        = string
  default     = null
}
variable "awsAz3" {
  description = "Availability zone, will dynamically choose one if left empty"
  type        = string
  default     = null
}

variable "servicesVpcCidrBlock2" {
  type    = string
  default = null
}
variable "servicesVpc2" {
  description = "Services VPC Region 2"
  type        = map(any)
}
variable "spokeVpcCidrBlock2" {
  type    = string
  default = null
}
variable "spokeVpc2" {
  description = "Spoke VPC Region 2"
  type        = map(any)
}

variable ssh_key {
    type = string
}

