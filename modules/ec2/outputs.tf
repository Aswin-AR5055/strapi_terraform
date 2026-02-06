output "instance_id" {
  value = aws_instance.my_ubuntu_instance.id
}

output "private_ip" {
  value = aws_instance.my_ubuntu_instance.private_ip
}

output "public_ip" {
  value = aws_instance.my_ubuntu_instance.public_ip
}