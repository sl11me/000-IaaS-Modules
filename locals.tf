locals {
  # EC2 configuration per environment
  ec2_by_env = {
    dev = {
      web = {
        ami           = "ami-068c0051b15cdb816"
        instance_type = "t2.micro"
        public_ip     = true
      }
    }
    stage = {
      web = {
        ami           = "ami-068c0051b15cdb816"
        instance_type = "t2.micro"
        public_ip     = true
      }
    }
    prod = {
      web = {
        ami           = "ami-068c0051b15cdb816"
        instance_type = "t2.small"
        public_ip     = false
      }
    }
  }

  # VPC configuration per environment
  vpc_by_env = {
    dev = {
      vpc_cidr        = "10.0.0.0/16"
      public_subnets  = ["10.0.1.0/24", "10.0.2.0/24"]
      private_subnets = ["10.0.101.0/24", "10.0.102.0/24"]
    }
    stage = {
      vpc_cidr        = "10.1.0.0/16"
      public_subnets  = ["10.1.1.0/24", "10.1.2.0/24"]
      private_subnets = ["10.1.101.0/24", "10.1.102.0/24"]
    }
    prod = {
      vpc_cidr        = "10.2.0.0/16"
      public_subnets  = ["10.2.1.0/24", "10.2.2.0/24"]
      private_subnets = ["10.2.101.0/24", "10.2.102.0/24"]
    }
  }
}

