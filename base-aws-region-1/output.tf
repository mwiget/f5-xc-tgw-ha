output workload1_private_ip {
  value = aws_instance.f5-workload-1.private_ip
}
output "jumphost1_public_ip" {
  value = aws_instance.f5-jumphost-1.public_ip
}

