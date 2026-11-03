terraform {
  backend "s3" {

    bucket = "tf-backend-08" # this must be your s3 bucket name
    key    = "Networking/bld/dev/vpc/terraform.tfstate"
    region = "ap-south-1"
  }
}
