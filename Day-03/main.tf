#this above for creating security group.
resource "aws_security_group" "allow_tls" {
  name        = "allow_tls"
  description = "Allow TLS inbound traffic and all outbound traffic"
  vpc_id      = "vpc-098523367d8ce6ff7"

  tags = {
    Name = "secure_gr"
  }
}

#this code for creating egress rule for security group.
resource "aws_vpc_security_group_egress_rule" "outbound_rule" {
  security_group_id = aws_security_group.allow_tls.id

  cidr_ipv4   = "0.0.0.0/0"
  ip_protocol = "-1"
  
}

#this code for  creating ingress rule for security group.
resource "aws_vpc_security_group_ingress_rule" "http_rule" {
  security_group_id = aws_security_group.allow_tls.id

  cidr_ipv4   = "0.0.0.0/0"
  from_port   = 80
  ip_protocol = "tcp"
  to_port     = 80
}

resource "aws_vpc_security_group_ingress_rule" "https_rule" {
  security_group_id = aws_security_group.allow_tls.id

  cidr_ipv4   = "0.0.0.0/0"
  #cidr_ipv6   = "::/0"
  from_port   = 443
  ip_protocol = "tcp"
  to_port     = 443

}

resource "aws_vpc_security_group_ingress_rule" "ssh_rule" {
  security_group_id = aws_security_group.allow_tls.id

  cidr_ipv4   = "0.0.0.0/0"
 # cidr_ipv6   = "::/0"
  from_port   = 22
  ip_protocol = "tcp"
  to_port     = 22
}

resource "aws_vpc_security_group_ingress_rule" "mysql_rule" {
  security_group_id = aws_security_group.allow_tls.id

  cidr_ipv4   = "0.0.0.0/0"
  #cidr_ipv6   = "::/0"
  from_port   = 3306
  ip_protocol = "tcp"
  to_port     = 3306
}

 resource "aws_vpc_security_group_ingress_rule" "icmp_rule" {

     security_group_id = aws_security_group.allow_tls.id

     ip_protocol = "icmp"
     cidr_ipv4   = "0.0.0.0/0"
     #cidr_ipv6   = "::/0"
     from_port = -1
     to_port = -1
 }


resource "aws_instance" "web_app" {
  ami = var.ami_id
  subnet_id = var.subnet_id
  instance_type = var.instance_type
#   count = var.instance_count
  associate_public_ip_address = var.public_ip
  vpc_security_group_ids = [aws_security_group.allow_tls.id]
  key_name = "B2-mumbai-key"
 user_data = <<-EOF
              #!/bin/bash
              sudo yum update -y
              sudo yum install httpd -y
              sudo systemctl start httpd
              sudo systemctl enable httpd
              echo "<h1>Welcome to Terraform Day-03</h1>" | sudo tee /var/www/html/index.html
            EOF


  tags = {
    Name = "web-app"
  }
}