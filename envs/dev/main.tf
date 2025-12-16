provider "aws" {
  region = "us-east-1"
}

module "vpc" {
  source = "../../modules/vpc"

  vpc_cidr        = "10.0.0.0/16"
  public_subnets  = ["10.0.1.0/24", "10.0.2.0/24"]
  private_subnets = ["10.0.101.0/24", "10.0.102.0/24"]

  tags = {
    Environment = "dev"
  }
}

resource "aws_security_group" "web" {
  name        = "web-sg-dev"
  description = "Allow HTTP and SSH"
  vpc_id      = module.vpc.vpc_id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Environment = "dev"
  }
}

module "ec2" {
  source = "../../modules/ec2"

  ami_id        = "ami-068c0051b15cdb816"
  instance_type = "t2.micro"
  subnet_id     = module.vpc.public_subnet_ids[0]

  security_group_ids = [
    aws_security_group.web.id
  ]

  associate_public_ip = true

  tags = {
    Name = "web-dev"
    Env  = "dev"
  }
}
