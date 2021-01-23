resource "aws_instance" "example" {
  ami           = "ami-07dd19a7900a1f049"
  instance_type = "t2.micro"
}
