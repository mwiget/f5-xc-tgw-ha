output workload2_private_ip {
  value = aws_instance.f5-workload-2.private_ip
}
output "jumphost2_public_ip" {
  value = aws_instance.f5-jumphost-2.public_ip
}

