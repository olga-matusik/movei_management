terraform {
  backend "s3" {
    bucket         = "ta-terraform-tfstates-727250514989"
    key            = "projects/ec2-movie-project/terraform.tfstates"
    dynamodb_table = "terraform-lock"
  }
}

