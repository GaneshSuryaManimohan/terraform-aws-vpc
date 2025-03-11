### Project Variables ###

variable "project_name" {
    type = string
}

variable "environment" {
    type = string
    default = "dev"
}

variable "common_tags" {
    type = map
}

### VPC Variables ###
variable "vpc_cidr" {
  type        = string
  default     = "10.0.0.0/16"
}

variable "enable_dns_hostnames" {
    type = bool
    default = true
}

variable "vps_tags" {
    type = map
    default = {}
}

### IGW ###
variable "igw_tags" {
    type = map
    default = {}
}

### Public Subnet ###
variable "public_subnet_cidrs" {
    type = list
    validation {
        condition = length(var.public_subnet_cidrs) == 2
        error_message = "Please provide 2 Valid Public Subnet CIDRs"
    }
}

variable "public_subnet_cidrs_tags" {
    type = map
    default = {}
}

### Private Subnet ###
variable "private_subnet_cidrs" {
    type = list
    validation {
        condition = length(var.private_subnet_cidrs) == 2
        error_message = "Please provide 2 Valid private Subnet CIDRs"
    }
}

variable "private_subnet_cidrs_tags" {
    type = map
    default = {}
}

### DB Subnet ###
variable "database_subnet_cidrs" {
    type = list
    validation {
        condition = length(var.database_subnet_cidrs) == 2
        error_message = "Please provide 2 Valid database Subnet CIDRs"
    }
}

variable "database_subnet_cidrs_tags" {
    type = map
    default = {}
}

variable "database_subnet_group_tags" {
    type = map
    default = {}
}

variable "nat_gateway_tags" {
    type = map
    default = {}
}

variable "pub_rt_tags" {
    type = map
    default = {}
}

variable "priv_rt_tags" {
    type = map
    default = {}
}

variable "db_rt_tags" {
    type = map
    default = {}
}

### Peering ###
variable "is_peering_required" {
    type = bool
    default = false
}

variable "accepter_vpc_id" {
    type = string
    default = ""
}

variable "vpc_peering_tags" {
    type = map
    default = {}
}