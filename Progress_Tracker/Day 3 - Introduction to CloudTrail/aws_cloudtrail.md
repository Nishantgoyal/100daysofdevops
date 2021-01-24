# Introduction to AWS CloudTrail

## [What is AWS CloudTrail](https://docs.aws.amazon.com/awscloudtrail/latest/userguide/cloudtrail-user-guide.html)

- AWS CloudTrail is an AWS service that helps you enable
  - governance
  - compliance
  - operational and risk auditing of your AWS account
- Actions taken by a user, role, or an AWS service are recorded as `events` in CloudTrail
- Events include actions taken in the AWS Management Console, AWS Command Line Interface, and AWS SDKs and APIs
- CloudTrail can be use to view, search, download, archive, analyze, and respond to account activity across your AWS infrastructure

## What are CloudTrail events?

- An event in CloudTrail is the record of an activity in an AWS account
- There are three types of events that can be logged in CloudTrail
  - management events
  - data events
  - CloudTrail Insights events
- By default, trails log management events, but not data or Insights events
- All event types use the same CloudTrail JSON log format.

### Management events

- Also known as **control plane operations**
- Provides information about management operations that are performed on resources in your AWS account
- Example management events include:
  - Configuring security (for example, `IAM AttachRolePolicy API operations`)
  - Registering devices (for example, `Amazon EC2 CreateDefaultVpc API operations`)
  - Configuring rules for routing data (for example, `Amazon EC2 CreateSubnet API operations`)
  - Setting up logging (for example, `AWS CloudTrail CreateTrail API operations`)
- Management events can also include [Non-API events](https://docs.aws.amazon.com/awscloudtrail/latest/userguide/cloudtrail-non-api-events.html)
  - For example: when a user signs in to your account, CloudTrail logs the `ConsoleLogin` event

### Data Events

- Provides information about the resource operations performed on or in a resource.
- Also known as `data plane operations`
- These are often high-volume activities
- These include:
  - Amazon S3 object-level API activity (for exaample, _GetObject_, _DeleteObject_, etc.)
  - AWS Lambda function execution activity (the Invoke API)
  - Amazon S3 object-level API activity on AWS Outposts
- Not logged by default when you create a trail
- To record CloudTrail data events, explicitly add to a trail the supported resources or resource types for which you want to collect activity

### Insight Events

- Capture unusual activities in AWS account
- On detection of unusual activity, insight events are logged to a different folder or prefix in the destination S3 folder for the trail
- Examples:
  - logging of 100 deleteBucketAPI calls per minute, instead of the usual 20 deleteBucketAPI calls

## CloudTrail Event History

- Provides a viewable, searchable, and downloadable record of the past 90 days of CloudTrail events

## Trails

- A configuration that enables delivery of CloudTrail events to an Amazon S3 bucket, CloudWatch Logs, and CloudWatch Events
- Trails can be used to
  - filter the CloudTrail events
  - encrypt the CloudTrail event log files
  - set up Amazon SNS notifications for log file delivery

## Organisation Trails

- A configuration that enables delivery of CloudTrail events in the management account and all member accounts in an AWS Organisations organisation to the same Amazon S3 bucket, CloudWatch Logs, and CloudWatch Events
- Helps you define a uniform event logging strategy for your organization
-
