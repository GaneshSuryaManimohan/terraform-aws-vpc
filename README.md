# Custom AWS VPC Module
This module creates the following resources:

* creates resources in first 2 AZ's (us-east-1a & us-east-1b)
* 1 VPC
* Internet Gateway
* IGW & VPC Attachment
* 2 Public Subnets (1 in each AZ for HA)
* 2 Private Subnets
* 2 DB Subnets
* Creates EIP
* NAT Gateway + EIP
* Public Route Table
* Private Route Table
* DB Route Table
* Route Table Association
* Routes in all tables
* Peering (if required for user)
* Routes of peering in requestor and acceptor VPC
* Database subnet group

### Inputs
* project_name (Required): User should mention their project name
* environment (Optional): by default dev, type is string
* common_tags (Required):  provide tags related to the project. Type is map
* vpc_cidr (Optional): default value is 10.0.0.0/16, type is string
* enable_dns_hostname (Optional): Default value is true. Type is bool



### Outputs
