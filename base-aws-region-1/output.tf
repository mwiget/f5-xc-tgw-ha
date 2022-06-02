output workload1a_private_ip {
  value = aws_instance.f5-workload-1a.private_ip
}
output workload1b_private_ip {
  value = aws_instance.f5-workload-1b.private_ip
}
output workload1c_private_ip {
  value = aws_instance.f5-workload-1c.private_ip
}
output jumphost1_public_ip {
  value = aws_instance.f5-jumphost-1.public_ip
}

