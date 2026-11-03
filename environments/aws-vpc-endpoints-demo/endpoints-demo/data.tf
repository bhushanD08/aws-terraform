#################################################
# NETWORK REMOTE STATE
#################################################

data "terraform_remote_state" "network" {

  backend = "s3"

  config = {

    bucket = "tf-backend-08" # this must be your s3 bucket name
    key    = "network/bld/dev/vpc-endpoints-demo/terraform.tfstate"
    region = "ap-south-1"
  }
}