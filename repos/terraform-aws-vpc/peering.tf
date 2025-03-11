resource "aws_vpc_peering_connection" "peering" {
  count = var.is_peering_required ? 1 : 0 # ensures:If true, 1 instance of the resource is created. If false, 0 instances are created.
  vpc_id        = aws_vpc.main.id # requester vpc
  peer_vpc_id   = var.accepter_vpc_id == "" ? data.aws_vpc.default.id : var.accepter_vpc_id
  auto_accept = var.accepter_vpc_id == "" ? true : false
  tags = merge(
    var.common_tags,
    var.vpc_peering_tags,
    {
        Name = "${local.resource_name}"
    }
  )
}

### Peering from subnets in expense-dev to Default VPC ###
resource "aws_route" "public_peering" {
  count = var.is_peering_required && var.accepter_vpc_id == "" ? 1 : 0
  route_table_id            = aws_route_table.public.id
  destination_cidr_block    = data.aws_vpc.default.cidr_block
  vpc_peering_connection_id = aws_vpc_peering_connection.peering[0].id
}

resource "aws_route" "private_peering" {
  count = var.is_peering_required && var.accepter_vpc_id == "" ? 1 : 0
  route_table_id            = aws_route_table.private.id
  destination_cidr_block    = data.aws_vpc.default.cidr_block # Default VPC's CIDR, fetched by data source refer data.tf
  vpc_peering_connection_id = aws_vpc_peering_connection.peering[0].id
}

resource "aws_route" "database_peering" {
  count = var.is_peering_required && var.accepter_vpc_id == "" ? 1 : 0
  route_table_id            = aws_route_table.db.id
  destination_cidr_block    = data.aws_vpc.default.cidr_block
  vpc_peering_connection_id = aws_vpc_peering_connection.peering[0].id
}

### Peering from Default VPC to expense-dev VPC ###
resource "aws_route" "default_peering" {
  count = var.is_peering_required && var.accepter_vpc_id == "" ? 1 : 0
  route_table_id            = data.aws_route_table.main.id
  destination_cidr_block    = var.vpc_cidr 
  vpc_peering_connection_id = aws_vpc_peering_connection.peering[0].id
}