module "vpc" {
  source = "terraform-aws-module/vpc/aws"
  name = var.VPC_NAME
  cidr = var.VPC_CIDR
  azs = [var.Zone1, var.Zone2, var.Zone3]
  private_subnets = [var.PriSub1CIDR, var.PriSub2CIDR, var.PriSub3CIDR]
  public_subnets = [var.PubSub1CIDR, var.PubSub2CIDR, var.PubSub3CIDR]
  enable_dns_support = true
  enable_dns_hostnames = true
  enable_nat_gateway = true
  single_nat_gateway = true

    tags = {
        Terraform = "true"
        Environment = "Prod"
    }
    vpc_tags = {
        Name = var.VPC_NAME
    }
}