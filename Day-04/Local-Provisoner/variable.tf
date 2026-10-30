variable "instance_ami_id" {
  type = string
  default = "ami-090d68841c2a28756"
}

variable "instance_type" {
  type = string
  default = "t3.micro"
}

variable "subnet_id" {
  type = string
  default = "subnet-0c3c23730218354a8"

}
variable "environment" {
  type = string
  default = "dev"
}
variable "sg_name" {
  type = string
  default = "sg_tf"
}

variable "vpc_id" {
  type = string
  description = "this for the vpc id sg"
  default = "vpc-098523367d8ce6ff7"
}

# variable "instance_count" {
#   description = "this for the number of the ec2 instances"
#   default = 4
#   type = number
# }

variable "associate_public_ip_address" {
  type = bool
  default = true
}

variable "key_name" {
  type = string
  default = "tf-key"
}