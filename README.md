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
* vpc_tags (Optional): Default value is empty. Type is map.
* igw_tags (Optional): Default value is empty. Type is map.
* public_subnet_cidrs (Required): User has to provide 2 valid subnet CIDR.
* public_subnet_cidr_tags (Optional): Default value is empty. Type is map.
* private_subnet_cidrs (Required): User has to provide 2 valid subnet CIDR.
* private_subnet_cidr_tags (Optional): Default value is empty. Type is map.
* database_subnet_cidrs (Required): User has to provide 2 valid subnet CIDR.
* database_subnet_cidr_tags (Optional): Default value is empty. Type is map.
* database_subnet_group_tags (Optional): Default value is empty. Type is map.
* nat_gateway_tags (Optional): Default value is empty. Type is map.
* public_route_table_tags (Optional): Default value is empty. Type is map.
* private_route_table_tags (Optional): Default value is empty. Type is map.
* database_route_table_tags (Optional): Default value is empty. Type is map.
* is_peering_required (Optional): Default value is false. Type is bool.
* acceptor_vpc_id (Optional): Default value is empty, default VPC ID would be taken. Type is string.
* vpc_peering_tags (Optional): Default value is empty. Type is map.

### Outputs
* vpc_id: VPC ID
* public_subnet_ids: A list of 2 public subnet IDS created.
* database_subnet_ids: A list of 2 database subnet IDS created.
* private_subnet_ids: A list of 2 private subnet IDS created.
* database_subnet_group_id: A database subnet group ID created.
* igw_id: internet gateway created.