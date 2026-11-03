terraform {
  backend "s3" {

    bucket = "tf-backend-08" # this must be your s3 bucket name
    key    = "compute/bld/dev/vpc-endpoints-demo-ec2/terraform.tfstate"
    region = "ap-south-1"
  }
}
