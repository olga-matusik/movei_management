resource "aws_instance" "my_public_server" {
  ami                    = data.aws_ami.aws_ubuntu.id
  instance_type          = var.ec2_type
  subnet_id              = data.aws_subnet.my_public_subnet.id
  vpc_security_group_ids = [aws_security_group.my_public_app_sg.id]
  key_name               = var.public_keypair
  #to use variables in the user_data file we need to have templatefile in terraform file and change user_data.sh to user_data.sh.launch_template {
  #templatefile(path, vars) as strings (?) to the file where you use the variable
  #variables as dictionary
  
  user_data = templatefile("${path.module}/user-data.sh.tpl", 
              {
                db_endpoint = aws_db_instance.movie_db.address,
                db_password = jsondecode(nonsensitive(data.aws_secretsmanager_secret_version.db_secret_version.secret_string))["movie_db_password"]
              })

  tags = {
    Name = "public_server"
  }
}