module "vpc" {
  source = "./modules/vpc"

  vpc_cidr        = local.vpc_by_env[var.environment].vpc_cidr
  public_subnets  = local.vpc_by_env[var.environment].public_subnets
  private_subnets = local.vpc_by_env[var.environment].private_subnets

  tags = {
    Environment = var.environment
  }
}

locals {
  ec2_instances = {
    web1 = {
      ami           = "ami-068c0051b15cdb816"
      instance_type = "t2.micro"
      public_ip     = true
    }
    web2 = {
      ami           = "ami-068c0051b15cdb816"
      instance_type = "t2.micro"
      public_ip     = true
    }
  }
}

module "ec2" {
  for_each = local.ec2_by_env[var.environment]
  source   = "./modules/ec2"

  ami_id        = each.value.ami
  instance_type = each.value.instance_type
  subnet_id     = module.vpc.public_subnet_ids[0]

  security_group_ids = [
    aws_security_group.web.id
  ]

  associate_public_ip = each.value.public_ip

  tags = {
    Name = "${each.key}-${var.environment}"
    Env  = var.environment
  }
}
