resource "aws_instance" "my_public_server" {
  ami                    = data.aws_ami.aws_ubuntu.id
  instance_type          = var.ec2_type
  subnet_id              = data.aws_subnet.my_public_subnet.id
  vpc_security_group_ids = [aws_security_group.my_public_app_sg.id]
  key_name               = var.public_keypair

  tags = {
    Name = "public_server"
  }
}