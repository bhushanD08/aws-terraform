terraform {
  backend "s3" {

    bucket = "tf-backend-08" # this must be your s3 bucket name
    key    = "storage/bld/dev/s3/demo/terraform.tfstate"
    region = "ap-south-1"
  }
}
