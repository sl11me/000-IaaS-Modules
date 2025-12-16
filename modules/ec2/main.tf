resource "aws_instance" "ec2-instance" {
  instance_type               = var.instance_type
  ami                         = var.ami_id
  subnet_id                   = var.subnet_id
  associate_public_ip_address = var.associate_public_ip
  vpc_security_group_ids      = var.security_group_ids

  tags = var.tags
}
