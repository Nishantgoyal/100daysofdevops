# AWS CloudWatch

- [AWS CloudWatch Documentation](https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/WhatIsCloudWatch.html)

## What Is Amazon CloudWatch?

- Monitors your AWS resources and the applications you run on AWS in real time
- Collect and track metrics, which are variables you can measure for your resources and applications
- Can help to create alarms that
  - Watch metrics and send notifications
  - Watch metrics and automatically make changes to the resources you are monitoring when a threshold is breached
- For example:
  - Monitor the CPU usage and disk reads and writes of your Amazon EC2 instances
  - Use this data to determine whether
    - To launch additional instances to handle increased load
    - To stop under-used instances to save money

## Accessing CloudWatch

- [Amazon CloudWatch console](https://console.aws.amazon.com/cloudwatch)
- [AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-getting-set-up.html)
- [CloudWatch API](http://docs.aws.amazon.com/AmazonCloudWatch/latest/APIReference/Welcome.html)
- [AWS SDKs](http://aws.amazon.com/tools)

## How CloudWatch Works

- [CloudWatch Architecture](cloudwatch_architecture.md)
