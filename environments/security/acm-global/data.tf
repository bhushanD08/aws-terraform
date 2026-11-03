data "terraform_remote_state" "dns_backend" {
  backend = "s3"

  config = {

    bucket = "tf-backend-08" # this must be your s3 bucket name
    key    = "global/dns/bhushandesale/terraform.tfstate"
    region = "ap-south-1"

  }
}
