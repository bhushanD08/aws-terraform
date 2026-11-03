environment          = "dev"
aws_region           = "ap-south-1"

name                 = "GameScores"
dynamodb_table_name  = "bld_dev_db"

hash_key             = "GameTitle"
attribute_name       = "GameTitle"
attribute_type       = "S"

range_key            = "UserId"
range_attribute_name = "UserId"
range_attribute_type = "S"

billing_mode         = "PROVISIONED"
read_capacity        = 20
write_capacity       = 20