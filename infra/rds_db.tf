resource "aws_db_instance" "movie_db" {
  allocated_storage    = var.db_storage
  db_name              = var.db_name
  engine               = var.db_engine
  engine_version       = var.db_engine_version
  instance_class       = var.db_instance_class
  username             = var.db_name
  password             = jsondecode(data.aws_secretsmanager_secret_version.db_secret_version.secret_string)["movie_db_password"]
  skip_final_snapshot  = var.db_skip_last_snapshot
  db_subnet_group_name = aws_db_subnet_group.db_subnet_group.id
  vpc_security_group_ids = [aws_security_group.db_sg.id]
}

#remember to make a main.tf file with data_sources !!!
resource "aws_db_subnet_group" "db_subnet_group" {
    name = "movie-db-subnet-group"
    subnet_ids = [data.aws_subnet.my_priv_subnet_1.id, data.aws_subnet.my_priv_subnet_2.id]

    tags = {
        Name = "My db subnet group"
    }
}