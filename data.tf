data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

resource "aws_instance" "web" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t3.micro"

  tags = {
    Name = "HelloSubhasri"
  }
}

data "aws_vpc" "talent_academy" {
  filter {
    name = "tag:Name"
    values = "lab_vpc"
  }
}
  data "aws_subnet" "public" {
  filter {
    name = "tag:Name"
    values = "public"
  }
}
