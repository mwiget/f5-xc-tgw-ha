resource "aws_instance" "f5-workload-1a" {
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
-e F5DEMO_NODENAME='TGW 1 Site (workload #1a)' \
-e F5DEMO_COLOR=ffd734 \
-e F5DEMO_NODENAME_SSL='AWS Environment (Backend App)' \
-e F5DEMO_COLOR_SSL=a0bf37 \
-e F5DEMO_BRAND=volterra \
-e F5DEMO_PONG_URL=http://backend.example.local:8080/pong/extended \
public.ecr.aws/y9n2y5q5/f5-demo-httpd:openshift
MYIP=$(/sbin/ip -o -4 addr list ens5 | awk '{print $4}' | cut -d/ -f1)
docker run -d --net host --name badger consul agent -server -ui -node=server-1 -bootstrap-expect=1 -client=0.0.0.0 -bind=$MYIP
docker exec badger /bin/sh -c "echo '{\"service\": {\"name\": \"workload1\", \"tags\": [\"go\"], \"port\": 8080}}' > /consul/config/workload1.json"
docker exec badger /bin/sh -c "echo '{\"service\": {\"name\": \"workload2\", \"tags\": [\"go\"], \"port\": 8080}}' > /consul/config/workload2.json"
docker exec badger consul reload
EOF

  tags = {
    Name = "${var.projectPrefix}-f5-xc-workload-1a"
  }
}

resource "aws_instance" "f5-workload-1b" {
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
-e F5DEMO_NODENAME='TGW 1 Site (workload #1b)' \
-e F5DEMO_COLOR=ffd734 \
-e F5DEMO_NODENAME_SSL='AWS Environment (Backend App)' \
-e F5DEMO_COLOR_SSL=a0bf37 \
-e F5DEMO_BRAND=volterra \
-e F5DEMO_PONG_URL=http://backend.example.local:8080/pong/extended \
public.ecr.aws/y9n2y5q5/f5-demo-httpd:openshift
EOF

  tags = {
    Name = "${var.projectPrefix}-f5-xc-workload-1b"
  }
}

resource "aws_instance" "f5-workload-1c" {
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
-e F5DEMO_NODENAME='TGW 1 Site (workload #1c)' \
-e F5DEMO_COLOR=ffd734 \
-e F5DEMO_NODENAME_SSL='AWS Environment (Backend App)' \
-e F5DEMO_COLOR_SSL=a0bf37 \
-e F5DEMO_BRAND=volterra \
-e F5DEMO_PONG_URL=http://backend.example.local:8080/pong/extended \
public.ecr.aws/y9n2y5q5/f5-demo-httpd:openshift
EOF

  tags = {
    Name = "${var.projectPrefix}-f5-xc-workload-1c"
  }
}

