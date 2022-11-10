# variables.tf

variable "region" {
     default = "us-east-1"
}
variable "availabilityZone1" {
     default = "us-east-1a"
}
variable "availabilityZone2" {
     default = "us-east-1b"
}
variable "vpcCIDRblock" {
    default = "10.0.0.0/16"
}
variable "publicSubnet1" {
    default = "10.0.1.0/24"
}
variable "publicSubnet2" {
    default = "10.0.2.0/24"
}
variable "privateSubnet1" {
    default = "10.0.3.0/24"
}
variable "privateSubnet2" {
    default = "10.0.4.0/24"
}
variable "privateSubnet3" {
    default = "10.0.5.0/24"
}
variable "privateSubnet4" {
    default = "10.0.6.0/24"
}


variable "dnsSupport" {
    default = true
}
variable "dnsHostNames" {
    default = true
}
variable "instanceTenancy" {
    default = "default"
}
variable "destinationCIDRblock" {
    default = "0.0.0.0/0"
}
variable "ingressCIDRblock" {
    type = list
    default = [ "0.0.0.0/0" ]
}
variable "egressCIDRblock" {
    type = list
    default = [ "0.0.0.0/0" ]
}
variable "mapPublicIP" {
    default = true
}

variable "rds_admin_pass" {
    default = "s3cr3tam3nt3"
}

variable "rds_admin_user" {
    default = "coffee_admin"
}
