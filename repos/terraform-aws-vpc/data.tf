data "aws_availability_zones" "available" {
  state = "available"
}

data "aws_vpc" "default" {                                                                                                                            
  default = true                                                                                                                                      
}

# data "aws_route_table" "default" {
#   route_table_id = data.aws_vpc.default.main_route_table_id
# }

# output "default_route_table_id" {
#   value = data.aws_route_table.default.id
# }

data "aws_route_table" "main" {
  vpc_id = data.aws_vpc.default.id
  filter {
    name = "association.main"
    values = ["true"]
  }
}
