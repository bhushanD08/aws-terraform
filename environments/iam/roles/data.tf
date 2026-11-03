data "terraform_remote_state" "iam_policy_iam" {

  backend = "s3"

  config = {

    bucket = "tf-backend-08" # this must be your s3 bucket name
    key    = "iam/bld/policy/terraform.tfstate"
    region = "ap-south-1"
  }
}