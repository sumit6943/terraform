####      version.tf   ####
terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~>5.39"
    }
  }
}
###  variable.tf ###
variable "my_vpc_region" {
 default = "My_Custom_network"
}

#####    provider.tf ###
provider "aws" {
  # Configuration options
  region = "ap-south-1"
}

###   provider alias ###
provider "aws" {
  # Configuration options
  alias = "us_east"
  region = "us-east-1"
}

### resource ####
resource "aws_vpc" "Mumbai" {
  cidr_block = "192.168.10.0/24"
  
  tags = { Name = var.my_vpc_region }
}

### resource alias ###
resource "aws_vpc" "USA" {
  cidr_block = "192.168.10.0/24"
  provider = aws.us_east
  tags = { Name = var.my_vpc_region }
}
