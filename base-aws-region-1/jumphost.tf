resource "aws_instance" "f5-jumphost-1" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t3.micro"
  subnet_id     = aws_subnet.f5-xc-spoke-external["az1"].id
  vpc_security_group_ids = [aws_security_group.f5-xc-spoke-vpc.id]
  key_name               = var.ssh_key
  user_data              = <<-EOF
#!/bin/bash
sleep 30
snap install docker
systemctl enable snap.docker.dockerd
systemctl start snap.docker.dockerd
sleep 30
docker run -d -p 80:80 --net host -e F5DEMO_APP=website -e F5DEMO_NODENAME="AWS Environment (Jumphost)" --restart always --name f5demoapp f5devcentral/f5-demo-httpd:nginx
              EOF

  tags = {
    Name = "${var.projectPrefix}-f5-xc-jumphost-1"
  }
}

