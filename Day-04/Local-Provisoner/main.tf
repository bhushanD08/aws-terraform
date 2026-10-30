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

  provisioner "local-exec" {
    command = "echo The instance ${self.public_ip} is now running >> instance_info.txt"
  }


  tags = {
    Name = "${var.environment}-web-server"
    Environment = var.environment
  }
}