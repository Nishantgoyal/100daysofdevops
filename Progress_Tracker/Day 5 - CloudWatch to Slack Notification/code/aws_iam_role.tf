data "aws_iam_policy" "AWS_Lambda_Basic_Execution_Policy" {
  arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
}

resource "aws_iam_role" "cloudwatch_to_slack_role" {
  name = "cloudwatch_to_slack"
  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "lambda.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}

resource "aws_iam_role_policy_attachment" "cloudwatch_agent_server_policy_attach" {
  role       = aws_iam_role.cloudwatch_to_slack_role.name
  policy_arn = data.aws_iam_policy.AWS_Lambda_Basic_Execution_Policy.arn
}
