resource "aws_instance" "web_app" {
  ami           = "ami-090d68841c2a28756"
  subnet_id     ="subnet-0c3c23730218354a8"
  instance_type = "t3.micro"

  tags = {
    Name = "web_app"
  }
}
