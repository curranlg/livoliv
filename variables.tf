# variables.tf
########## Currently set via EXPORT variables, read from password keeper
variable "dns_access_key" {
  description = "Access key for AWS account hosting Route53 domains"
}
variable "dns_secret_key" {
  description = "Secret key for AWS account hosting Route53 domains"
}
##########

variable "region" {
  description = "Set the AWS Region"
  type = string
  default = "eu-west-2"
}
variable "availabilityZoneA" {
  description = "Set the first availability zone in region"
  type = string
  default = "eu-west-2a"
}
variable "availabilityZoneB" {
  description = "Set the second availability zone in region"
  type = string
  default = "eu-west-2b"
}
variable "environment" {
  description = "Set the environment name for all resources - defaults to staging"
  type = string
  default = "staging"
}
variable "vpcname" {
  description = "Set the name for the VPC"
  type = string
  default = "terraform"
}
variable "instanceTenancy" {
  default = "default"
}
variable "dnsSupport" {
  default = true
}
variable "dnsHostNames" {
  default = true
}
variable "vpcCIDRblock" {
  default = "10.0.0.0/16"
}
variable "subnetCIDRblockPublicA" {
  default = "10.0.0.0/24"
}
variable "subnetCIDRblockPublicB" {
  default = "10.0.1.0/24"
}
variable "subnetCIDRblockPrivateA" {
  default = "10.0.2.0/24"
}
variable "subnetCIDRblockPrivateB" {
  default = "10.0.3.0/24"
}
variable "InternetCIDRblock" {
  default = "0.0.0.0/0"
}
variable "ipv6InternetCIDRblock" {
  type    = list
  default = ["::/0"]
}

########## Variables for the MySQL DB master user
variable "dbusername" {
  # Username set via EXPORT of environment variable
  description = "The username for the DB master user"
  type = string
}
variable "dbuserpass" {
  # Password set via EXPORT of environment variable
  description = "The password for the DB master user"
  type = string
}
### end
# end of variables.tf