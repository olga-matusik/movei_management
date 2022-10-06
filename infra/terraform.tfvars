#assigning values to variables
aws_owner_id       = "099720109477"               #ami owner ID, not mine!!!!
aws_ami_name       = "ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*" #name find in the console AMI -> public images -> search
vpc_name           = "vpc"
public_subnet_name = "Pub1"
priv_subnet_name_1 = "Priv1"
priv_subnet_name_2 = "Priv2"
ec2_type           = "t3.medium"
public_keypair     = "movie-pub-key"
db_storage        = 10
db_name           = "movie_db"
db_engine         = "mysql"
db_engine_version = "8.0.30"
db_instance_class = "db.t2.small"
db_username       = "root"
