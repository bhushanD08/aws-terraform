terraform {
  backend "s3" {
    bucket = "tf-backend-08"
    key    = "compute/Day-04/Remote-provisoner/terraform.tfstate"
    region = "ap-south-1"
  }
}