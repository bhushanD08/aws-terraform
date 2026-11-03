module "aws_iam_policy" {
    source = "../../../modules/iam/policy"
  policy_json = file(
    "${path.module}/ec2-readonly-policy.json"
  )
    aws_region = var.aws_region
}