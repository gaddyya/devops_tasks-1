resource "aws_instance" "ec2" {
  ami                    = var.ec2_ami
  instance_type          = var.instance_type
  key_name               = var.key_name
  vpc_security_group_ids = var.vpc_sg_id
  subnet_id              = var.subnet_id
  tags = {
    Name = var.tag_name
    Environment = var.tag_env
  }

}
