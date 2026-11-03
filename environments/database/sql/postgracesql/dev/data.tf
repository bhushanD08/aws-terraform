#############################################################
# Network Remote State
#############################################################

data "terraform_remote_state" "network" {

  backend = "s3"

  config = {

    bucket = "tf-backend-08" # this must be your s3 bucket name
    key    = "network/bld/dev/vpc/terraform.tfstate"
    region = "ap-south-1"
  }
}




#############################################################
# KMS Remote State
#############################################################

data "terraform_remote_state" "kms" {

  backend = "s3"

  config = {
    bucket = "tf-backend-08" # this must be your s3 bucket name
    key    = "security/bld/dev/kms/terraform.tfstate"
    region = "ap-south-1"
  }

}