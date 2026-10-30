resource "aws_key_pair" "custom_key" {
  key_name   = "tf-key"
  public_key = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIOnV3UMdh8THdtrX4fSWKrGohMMev5bLvI/Bj94oRdG9 hp@DESKTOP-S5I8T5N"
}

resource "aws_instance" "example" {
  ami                         = var.instance_ami_id
  instance_type               = var.instance_type
  subnet_id                   = var.subnet_id
  associate_public_ip_address = var.associate_public_ip_address
  vpc_security_group_ids      = [aws_security_group.tf_sg.id]
  key_name                    = aws_key_pair.custom_key.key_name
  provisioner "remote-exec" {
    inline = [
      "sudo yum update -y",
      "sudo yum install -y nginx",
      "sudo systemctl enable nginx",
      "sudo systemctl start nginx",
      "echo 'Hello from Terraform remote-exec!' | sudo tee /usr/share/nginx/html/index.html > /dev/null"
    ]

    connection {
      type        = "ssh"
      host        = self.public_ip
      user        = "ec2-user"
      private_key = file("C:\\aws-terraform\\Day-04\\tf-key.pem")
      timeout     = "4m"
    }
  }

  tags = {
    Name        = "${var.environment}-web-server"
    Environment = var.environment
  }
}