data "terraform_remote_state" "vpc_backend" {
  backend = "s3"

  config = {

    bucket = "tf-backend-08" # this must be your s3 bucket name
    key    = "Networking/bld/dev/vpc/terraform.tfstate"
    region = "ap-south-1"

  }
}
