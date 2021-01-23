# Amazon Simple Notification Service

## What is Amazon SNS?

- A managed service that provides message delivery from publishers to subscribers
- A topic is a logical access point and communication channel
- Publishers communicate asynchronously with subscribers by sending messages to a topic
- Clients can subscribe to the SNS topic and receive published messages using a supported protocol
- Supported protocols are
  - Amazon Kinesis Data Firehose
  - Amazon SQS
  - AWS Lambda
  - HTTP
  - email
  - mobile push notifications
  - mobile text messages (SMS)

![SNS Delivery Protocols](https://docs.aws.amazon.com/sns/latest/dg/images/sns-delivery-protocols.png)

---

## Features and capabilities

- Application-to-application messaging
  - Supports subscribers such as
    - Amazon Kinesis Data Firehose delivery streams
    - Lambda functions
    - Amazon SQS queues
    - HTTP/S endpoints
    - AWS Event Fork Pipelines
- Application-to-person notifications
  - Provides user notifications to subscribers such as
    - mobile applications
    - mobile phone numbers
    - email addresses
- Standard and FIFO topics
  - Use a FIFO topic to
    - ensure strict message ordering
    - define message groups
    - Prevent message duplication
  - Only Amazon SQS FIFO queues can subscribe to a FIFO topic
  - Use a standard topic when message delivery order and possible message duplication are not critical
  - All of the supported delivery protocols can subscribe to a standard topic
- Message durability
  - Published messages are stored across multiple, geographically separated servers and data centers.
  - If a subscribed endpoint isn't available, Amazon SNS runs a [delivery retry policy](https://docs.aws.amazon.com/sns/latest/dg/sns-message-delivery-retries.html)
  - To preserve any messages that aren't delivered before the delivery retry policy ends, a [dead-letter queue](https://docs.aws.amazon.com/sns/latest/dg/sns-dead-letter-queues.html) can be created
- Message archiving and analytics
  - [Kinesis Data Firehose delivery streams](https://docs.aws.amazon.com/sns/latest/dg/sns-firehose-as-subscriber.html) can subscribe to SNS topics
  - It allow sending notifications to additional archiving and analytics endpoints such as
    - Amazon Simple Storage Service (Amazon S3) buckets
    - Amazon Redshift tables
    - etc...
- Message attributes
  - [Message attributes](https://docs.aws.amazon.com/sns/latest/dg/sns-message-attributes.html) can provide any arbitrary metadata about the message
- [Message filtering](https://docs.aws.amazon.com/sns/latest/dg/sns-message-filtering.html)
  - By default, each subscriber receives every message published to the topic
  - To receive a subset of the messages, a subscriber must assign a filter policy to the topic subscription
  - When the incoming message attributes match the filter policy attributes, the message is delivered to the subscribed endpoint, else, the message is filtered out
- [Message security](https://docs.aws.amazon.com/sns/latest/dg/sns-server-side-encryption.html)
  - Server-side encryption protects the contents of messages that are stored in Amazon SNS topics, using encryption keys provided by AWS KMS
  - A private connection between Amazon SNS and virtual private cloud (VPC) can also be established
