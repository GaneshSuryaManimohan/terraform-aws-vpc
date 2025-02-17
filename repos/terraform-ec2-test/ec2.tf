module "ec2-test" {
  source        = "../terraform-aws-ec2"
  instance_type = "t3.small" #this will override the instance_type variables in terraform-aws-ec2
  tags = {
    createdby = "module"
    terraform = "true"
  }
}