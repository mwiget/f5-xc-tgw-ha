variable "buildSuffix" {
  type        = string
  default     = null
  description = "random build suffix for resources"
}
variable "projectPrefix" {
  type        = string
  description = "projectPrefix name for tagging"
}

variable "awsRegion1" {
  description = "aws region 1"
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

variable "servicesVpcCidrBlock1" {
  type    = string
  default = null
}
variable "servicesVpc1" {
  description = "Services VPC Region 1"
  type        = map(any)
}
variable "spokeVpcCidrBlock1" {
  type    = string
  default = null
}
variable "spokeVpc1" {
  description = "Spoke VPC Region 1"
  type        = map(any)
}

variable ssh_key {
    type = string
}

