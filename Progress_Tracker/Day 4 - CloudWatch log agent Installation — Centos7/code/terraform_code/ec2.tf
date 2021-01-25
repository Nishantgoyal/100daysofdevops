resource "aws_instance" "test_instance" {
  ami           = "ami-07dd19a7900a1f049"
  instance_type = "t2.micro"
  iam_instance_profile = aws_iam_instance_profile.cloudwatch_logs_to_ssm_profile.name
  key_name = aws_key_pair.cloudwatch_logs_key.key_name
  tags = {
    Name = "CloudWatch Logs Test"
  }
}