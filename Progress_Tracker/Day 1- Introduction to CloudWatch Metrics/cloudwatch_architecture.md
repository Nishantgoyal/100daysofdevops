# How Amazon CloudWatch Works

## Architecture Diagram

![Cloudwatch Architecture](https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/images/CW-Overview.png)

- Basically a ***metrics repository***
- An AWS service (such as Amazon EC2) puts metrics into the repository
- Retrieve statistics based on those metrics
- Can also be used to put custom metrics into the repository and retrieve statistics on these metrics as well
- [AWS resources that generate and send metrics to CloudWatch](https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/aws-services-cloudwatch-metrics.html)
- Metrics are stored separately in Regions, but one can use ***CloudWatch cross-Region functionality*** to aggregate statistics from different Regions

## CloudWatch console

- Metrics in cloudwatch can be used to calculate statistics
- The statistics can then be presented in the CloudWatch console

## Cloudwatch Alarms

- [Cloudwatch Alarms](https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/cloudwatch_concepts.html#CloudWatchAlarms)
- You can configure alarm actions to
  - stop
  - start
  - terminate an Amazon EC2 instance when certain criteria are met
- Initiate Amazon EC2 Auto Scaling and Amazon Simple Notification Service (Amazon SNS) actions based on metrics and thresholds

## Amazon CloudWatch Concepts

- [Amazon CloudWatch Concepts](amazon_cloudwatch_concepts.md)
