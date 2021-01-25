# arn:aws:iam::aws:policy/CloudWatchAgentServerPolicy
# arn:aws:iam::aws:policy/AmazonSSMFullAccess

data "aws_iam_policy" "cloudwatch_agent_server_policy" {
  arn = "arn:aws:iam::aws:policy/CloudWatchAgentServerPolicy"
}

data "aws_iam_policy" "amazon_ssm_full_access_policy" {
  arn = "arn:aws:iam::aws:policy/AmazonSSMFullAccess"
}

resource "aws_iam_role" "cloudwatch_logs_to_ssm_role" {
  name = "cloudwatch_logs_to_ssm"
  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}

resource "aws_iam_role_policy_attachment" "cloudwatch_agent_server_policy_attach" {
  role       = aws_iam_role.cloudwatch_logs_to_ssm_role.name
  policy_arn = data.aws_iam_policy.cloudwatch_agent_server_policy.arn
}

resource "aws_iam_role_policy_attachment" "amazon_ssm_full_access_policy_attach" {
  role       = aws_iam_role.cloudwatch_logs_to_ssm_role.name
  policy_arn = data.aws_iam_policy.amazon_ssm_full_access_policy.arn
}

resource "aws_iam_instance_profile" "cloudwatch_logs_to_ssm_profile" {
  name = "cloudwatch_logs_to_ssm"
  role = aws_iam_role.cloudwatch_logs_to_ssm_role.name
}