data "aws_ami" "my_ubuntu_ami" {
  most_recent = true
  owners = [ "099720109477" ]

  filter {
    name = "name"
    values = [ "ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*" ]
  }

  filter {
    name = "virtualization-type"
    values = [ "hvm" ]
  }
}

resource "aws_instance" "my_ubuntu_instance" {
  ami = data.aws_ami.my_ubuntu_ami.id
  instance_type = var.instance_type
  subnet_id = var.subnet_id
  vpc_security_group_ids = [ var.security_group_id ]
  key_name = var.key_name
  associate_public_ip_address = true
  user_data = file("${path.module}/user_data.sh")

  tags = {
    Name = "${var.environment}-private-ec2"
  }
}