# AWS CloudWatch Logs

- Amazon CloudWatch Logs are used to monitor, store, and access the log files from Amazon Elastic Compute Cloud (Amazon EC2) instances, AWS CloudTrail, Route53, and other sources.
- It enables centralization of logs from all systems, applications, and AWS services in a single, highly scalable service.
- ![CloudWatch Logs Architecture Diagram](https://miro.medium.com/max/1400/1*tliaClRKRUZPBrjvo0_0Zw.jpeg)

## CloudWatch Logs Concepts

### Log Events

- It is a record of some activity recorded by the application or resource being monitored
- It contains two properties:
  - the timestamp of when the event occured
  - the raw event message

### Log Streams

- A sequence of log events that share the same source
- Intended to represent the sequence of events coming from the application instance or resource being monitored

### Log Groups

- It define groups of log streams that share the same
  - retention
  - monitoring
  - access control settings

### Metric Filters

- Metric filters are used to extract metric observations from ingested events and transform them to data points in a CloudWatch metric
- These are assigned to log groups
- All the filters assigned to a log group are applied to their log streams

### Retention Settings

- It can be used to specify how long log events are kept in CloudWatch Logs
- Expired log events get deleted automatically
- These are also assigned to log groups, and applied to the log streams belonging to the log group
