variable "environment" {
  type    = string
  default = "dev"
}

locals {
  ec2_instances = {
    web1 = {
      ami           = "ami-068c0051b15cdb816"
      instance_type = "t3.micro"
      public_ip     = true
    }
    web2 = {
      ami           = "ami-068c0051b15cdb816"
      instance_type = "t3.micro"
      public_ip     = true
    }
  }
}

module "ec2" {
  for_each = local.ec2_instances
  source   = "./modules/ec2"

  ami_id              = each.value.ami
  instance_type       = each.value.instance_type
  associate_public_ip = each.value.public_ip

  tags = {
    Name = "${var.environment}-${each.key}"
    Env  = var.environment
  }
}
