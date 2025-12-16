output "ec2_public_ips" {
  value = {
    for name, mod in module.ec2 :
    name => mod.public_ip
  }
}
