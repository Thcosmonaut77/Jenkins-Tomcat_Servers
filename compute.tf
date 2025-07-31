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

  owners = ["099720109477"] 
}

# Create the EC2 instance and assign key pair
resource "aws_instance" "first_instance" {
  ami                    = data.aws_ami.ubuntu.id
  instance_type          = "t2.micro"
  vpc_security_group_ids = [aws_security_group.allow_web.id]
  subnet_id              = aws_subnet.prodsubnet1.id
  key_name               = "new"
  availability_zone      = "us-east-1a"
  user_data              =file("Scripts/install_jenkins.sh")
  tags = {
    Name = "Jenkins-Server"
  }
}

resource "aws_instance" "second_instance" {
  ami                    = data.aws_ami.ubuntu.id
  instance_type          = "t2.micro"
  vpc_security_group_ids = [aws_security_group.allow_web.id]
  subnet_id              = aws_subnet.prodsubnet1.id
  key_name               = "new"
  availability_zone      = "us-east-1a"
  user_data              =file("Scripts/install_tomcat.sh")
  tags = {
    Name = "Tomcat-Server"
  }
}