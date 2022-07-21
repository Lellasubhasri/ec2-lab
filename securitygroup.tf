resource "aws_security_group" "allow_tls" {
  name        = "ansible_server"
  description = "Allow connection for ansible inbound traffic"
  vpc_id      = data.aws_vpc.lab_vpc.id

  ingress {
    description      = "allow port 80"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["103.91.88.205/32"]
  }

  ingress {
    description      = "allow port 22"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["103.91.88.205/32"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "ansible_server"
  }
}