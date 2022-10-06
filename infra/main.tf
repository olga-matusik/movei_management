data "aws_ami" "aws_ubuntu" {
  owners      = [var.aws_owner_id] #ami owner
  most_recent = true
  filter {
    name   = "name"
    values = [var.aws_ami_name]
  }
}

data "aws_vpc" "my_vpc" {
  filter {
    name   = "tag:Name"
    values = [var.vpc_name]
  }
}

data "aws_subnet" "my_public_subnet" {
  filter {
    name   = "tag:Name"
    values = [var.public_subnet_name]
  }
}

data "aws_subnet" "my_priv_subnet_1" {
  filter {
    name   = "tag:Name"
    values = [var.priv_subnet_name_1]
  }
}

data "aws_subnet" "my_priv_subnet_2" {
  filter {
    name   = "tag:Name"
    values = [var.priv_subnet_name_2]
  }
}

#getting password from secret manager by name and version!!!
data "aws_secretsmanager_secret" "db_secret" {
  name = "movie_db_password"
}

data "aws_secretsmanager_secret_version" "db_secret_version" {
  secret_id = data.aws_secretsmanager_secret.db_secret.id
}