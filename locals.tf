locals {
  ec2_by_env = {
    dev = {
      web = {
        ami           = "ami-068c0051b15cdb816"
        instance_type = "t3.micro"
        public_ip     = true
      }
    }
    prod = {
      web = {
        ami           = "ami-068c0051b15cdb816"
        instance_type = "t3.small"
        public_ip     = false
      }
    }
  }
}
