data "terraform_remote_state" "launch_template_backend" {
  backend = "s3"

  config = {

    bucket = "tf-backend-08" # this must be your s3 bucket name
    key    = "compute/bld/dev/lt/terraform.tfstate"
    region = "ap-south-1"

  }
}

######################################################
#### vpc_backend
#####################################################

data "terraform_remote_state" "vpc_backend" {
  backend = "s3"

  config = {

    bucket = "tf-backend-08" # this must be your s3 bucket name
    key    = "network/bld/dev/vpc/terraform.tfstate"
    region = "ap-south-1"

  }
}


###################################################
#######   acm alb backend 
###################################################

data "terraform_remote_state" "tg_backend" {
  backend = "s3"

  config = {

    bucket = "tf-backend-08" # this must be your s3 bucket name
    key    = "compute/bld/dev/tg/terraform.tfstate"
    region = "ap-south-1"

  }
}


###################################################
#######   dns backend 
###################################################

data "terraform_remote_state" "dns_backend" {
  backend = "s3"

  config = {

    bucket = "tf-backend-08" # this must be your s3 bucket name
    key    = "global/dns/bhushandesale/terraform.tfstate"
    region = "ap-south-1"

  }
}


###################################################
#######    alb backend 
###################################################

data "terraform_remote_state" "alb_backend" {
  backend = "s3"

  config = {

    bucket = "tf-backend-08" # this must be your s3 bucket name
    key    = "compute/bld/dev/alb/terraform.tfstate"
    region = "ap-south-1"

  }
}