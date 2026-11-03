#################################################
# LOCAL TAGS
#################################################

locals {

  common_tags = {

    Environment = var.environment

    ManagedBy   = "Terraform"

    Project     = var.project_name
  }
}


resource "aws_iam_user" "bld_iam_user" {
  name = var.iam_user_name
}


resource "aws_iam_user_policy_attachment" "bld_iam_user_ro_policy_attachment" {
    user = aws_iam_user.bld_iam_user.id
    policy_arn = var.bld_iam_user_ec2_ro
}


resource "aws_iam_access_key" "tf_user_acces_key" {
  user    = aws_iam_user.bld_iam_user.name
 
}