resource "aws_instance" "ec2-instance" {
  instance_type = var.instance_type
  ami           = var.ami_id

  associate_public_ip_address = var.associate_public_ip

  tags = var.tags
}
