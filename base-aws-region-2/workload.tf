resource "aws_instance" "f5-workload-2a" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t3.micro"
  subnet_id     = aws_subnet.f5-xc-spoke-workload["az1"].id
  vpc_security_group_ids = [aws_security_group.f5-xc-spoke-vpc.id]
  key_name               = var.ssh_key
  user_data              = <<-EOF
#!/bin/bash
until ping -c3 -W1 1.1.1.1; do echo "waiting for internet connectivity ..." && sleep 5; done
snap install docker
systemctl enable snap.docker.dockerd
systemctl start snap.docker.dockerd
sleep 30
docker run -d  --net=host --restart=always \
-e F5DEMO_APP=text \
-e F5DEMO_NODENAME='TGW 2 Site (workload #2a)' \
-e F5DEMO_COLOR=ffd734 \
-e F5DEMO_NODENAME_SSL='AWS Environment (Backend App)' \
-e F5DEMO_COLOR_SSL=a0bf37 \
-e F5DEMO_BRAND=volterra \
-e F5DEMO_PONG_URL=http://backend.example.local:8080/pong/extended \
public.ecr.aws/y9n2y5q5/f5-demo-httpd:openshift
EOF

  tags = {
    Name = "${var.projectPrefix}-f5-xc-workload-2a"
  }
}

resource "aws_instance" "f5-workload-2b" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t3.micro"
  subnet_id     = aws_subnet.f5-xc-spoke-workload["az2"].id
  vpc_security_group_ids = [aws_security_group.f5-xc-spoke-vpc.id]
  key_name               = var.ssh_key
  user_data              = <<-EOF
#!/bin/bash
until ping -c3 -W1 1.1.1.1; do echo "waiting for internet connectivity ..." && sleep 5; done
snap install docker
systemctl enable snap.docker.dockerd
systemctl start snap.docker.dockerd
sleep 30
docker run -d  --net=host --restart=always \
-e F5DEMO_APP=text \
-e F5DEMO_NODENAME='TGW 2 Site (workload #2b)' \
-e F5DEMO_COLOR=ffd734 \
-e F5DEMO_NODENAME_SSL='AWS Environment (Backend App)' \
-e F5DEMO_COLOR_SSL=a0bf37 \
-e F5DEMO_BRAND=volterra \
-e F5DEMO_PONG_URL=http://backend.example.local:8080/pong/extended \
public.ecr.aws/y9n2y5q5/f5-demo-httpd:openshift
EOF

  tags = {
    Name = "${var.projectPrefix}-f5-xc-workload-2b"
  }
}

resource "aws_instance" "f5-workload-2c" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t3.micro"
  subnet_id     = aws_subnet.f5-xc-spoke-workload["az3"].id
  vpc_security_group_ids = [aws_security_group.f5-xc-spoke-vpc.id]
  key_name               = var.ssh_key
  user_data              = <<-EOF
#!/bin/bash
until ping -c3 -W1 1.1.1.1; do echo "waiting for internet connectivity ..." && sleep 5; done
snap install docker
systemctl enable snap.docker.dockerd
systemctl start snap.docker.dockerd
sleep 30
docker run -d  --net=host --restart=always \
-e F5DEMO_APP=text \
-e F5DEMO_NODENAME='TGW 2 Site (workload #2c)' \
-e F5DEMO_COLOR=ffd734 \
-e F5DEMO_NODENAME_SSL='AWS Environment (Backend App)' \
-e F5DEMO_COLOR_SSL=a0bf37 \
-e F5DEMO_BRAND=volterra \
-e F5DEMO_PONG_URL=http://backend.example.local:8080/pong/extended \
public.ecr.aws/y9n2y5q5/f5-demo-httpd:openshift
EOF

  tags = {
    Name = "${var.projectPrefix}-f5-xc-workload-2c"
  }
}

