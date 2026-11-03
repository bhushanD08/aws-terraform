terraform {
  backend "s3" {

    bucket = "tf-backend-08" # this must be your s3 bucket name
    key    = "database/bld/dev/rds/psql/terraform.tfstate"
    region = "ap-south-1"
  }
}
