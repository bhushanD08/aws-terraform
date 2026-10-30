resource "aws_key_pair" "custom_key" {
  key_name   = "tf-key"
  public_key = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIOnV3UMdh8THdtrX4fSWKrGohMMev5bLvI/Bj94oRdG9 hp@DESKTOP-S5I8T5N"
}


resource "aws_instance" "example" {
  ami           = var.instance_ami_id
  instance_type = var.instance_type
  subnet_id = var.subnet_id
  # count = var.instance_count
  associate_public_ip_address = var.associate_public_ip_address
  vpc_security_group_ids = [aws_security_group.tf_sg.id]
  key_name = aws_key_pair.custom_key.key_name

connection {
  host = self.public_ip
  user = "ec2-user"
  type = "ssh"
  private_key = file("C:\\aws-terraform\\Day-04\\tf-key.pem")
  timeout = "4m"
}

provisioner "file" {
  source = "C:\\aws-terraform\\Day-04\\index.html"
  destination = "/home/ec2-user/index.html"
}


  tags = {
    Name = "${var.environment}-web-server"
    Environment = var.environment
  }
}