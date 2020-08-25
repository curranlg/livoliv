########## Set the backend location for storing statefile
terraform {
  backend "local" {
    # path is verracrypt encrypted volume - need to mount prior to running
    path = "/Volumes/terraform/livoliv/terraform.tfstate"
  }
}

######### Declare AWS as the provider
provider "aws" {
  version = "~> 2.0"
  ### Access keys currently set in ~/.aws/credentials - set via 'awscli configure'
  #access_key = var.access_key 
  #secret_key = var.secret_key 
  region = var.region
}
# Set 2nd AWS account as alias - used for Route53 domains hosted in a seperate account
provider "aws" {
  alias = "dns"
  version = "~> 2.0"
  access_key = var.dns_access_key 
  secret_key = var.dns_secret_key 
  region = var.region
}

########## Create the VPC
module "vpc" {
  source = "../modules/vpc"
  providers = {aws = aws}
  ### pass required variables to module
  vpcname = var.vpcname
  vpcCIDRblock = var.vpcCIDRblock
  instanceTenancy = var.instanceTenancy
  dnsSupport = var.dnsSupport
  dnsHostNames = var.dnsHostNames
  environment = var.environment
  availabilityZoneA = var.availabilityZoneA
  availabilityZoneB = var.availabilityZoneB
  subnetCIDRblockPublicA = var.subnetCIDRblockPublicA
  subnetCIDRblockPublicB = var.subnetCIDRblockPublicB
  subnetCIDRblockPrivateA = var.subnetCIDRblockPrivateA
  subnetCIDRblockPrivateB = var.subnetCIDRblockPrivateB
  InternetCIDRblock = var.InternetCIDRblock
}
# End of Resource

/*
########## Make call to the RDS module to setup the RDS DB
module "rds" {
  source = "./rds"
  providers = {
    aws = aws}
}
# End of Resource

########## Make call to the Certificates module to request SSL cert
module "certificates" {
  source = "./certificates"
  providers = {
    aws.dns = aws.dns}
}
# End of Resource
*/