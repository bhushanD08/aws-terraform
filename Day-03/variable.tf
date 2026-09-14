variable "ami_id" {
  type = string
  default = "ami-08188a5a4dfdbd573"
}


variable "subnet_id" {
  type = string
  default = "subnet-0c3c23730218354a8"
  description = "this for the aws subnet id"
}

variable "instance_type" {
  type = string
  default = "t3.micro"
  description = "this for the instance type"
}

variable "instance_count" {
  type = number
  default = 1
}

variable "public_ip" {
  type = bool
  default = true
  description = "this for public ip"
}