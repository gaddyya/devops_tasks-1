data "aws_ami" "latest_ubuntu" {
  owners      = var.ami_owners
  most_recent = true
  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }
}

resource "aws_instance" "ec2" {
  ami           = data.aws_ami.latest_ubuntu.id
  instance_type = "t2.micro"
  key_name               = "trainee8"
  vpc_security_group_ids = var.ec2_vpc_sg_id
  subnet_id              = ""
  name = var.ec2_name
}