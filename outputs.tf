output "ec2_public_ips" {
  value = {
    for name, mod in module.ec2 :
    name => mod.public_ip
  }
}

output "vpc_id" {
  value = module.vpc.vpc_id
}

output "public_subnet_ids" {
  value = module.vpc.public_subnet_ids
}

output "security_group_web_id" {
  value = aws_security_group.web.id
}
