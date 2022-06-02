output workload2a_private_ip {
  value = aws_instance.f5-workload-2a.private_ip
}
output workload2b_private_ip {
  value = aws_instance.f5-workload-2b.private_ip
}
output workload2c_private_ip {
  value = aws_instance.f5-workload-2c.private_ip
}
output jumphost2_public_ip {
  value = aws_instance.f5-jumphost-2.public_ip
}

