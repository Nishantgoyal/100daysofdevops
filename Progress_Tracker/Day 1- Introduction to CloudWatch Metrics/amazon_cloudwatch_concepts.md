# Amazon CloudWatch Concepts

## Namespaces

- A ***namespace*** is a container for CloudWatch metrics
- Metrics in different namespaces are isolated from each other, so that metrics from different applications are not mistakenly aggregated into the same statistics.
- **No *default* namespace**
- Must specify a namespace for each data point you publish to CloudWatch
  - Can specify a namespace name when you create a metric
- Namaspace names must
  - contain valid XML characters
    - alphanumeric characters (0-9A-Za-z)
    - period (.)
    - hyphen (-)
    - underscore (_)
    - forward slash (/)
    - hash (#)
    - colon (:)
  - Be fewer than 256 characters in length
- AWS namespaces typically use the following naming convention: ***AWS/service***
- For example: *Amazon EC2 uses the AWS/EC2 namespace*

---

## Metrics

- Fundamental concept in CloudWatch
- Represents a time-ordered set of data points that are published to CloudWatch
- ***Think of a metric as a variable to monitor, and the data points as representing the values of that variable over time***
- For example
  - the CPU usage of a particular EC2 instance is one metric provided by Amazon EC2
- Many AWS services provide free metrics for resources
  - Amazon EC2 instances
  - Amazon EBS volumes
  - Amazon RDS DB instances
- One can also
  - enable detailed monitoring for some resources
  - publish own application metrics
- For custom metrics, one can add the data points in any order, and at any rate
- Statistics about those data points can be retrieved as an ordered set of time-series data
- Metrics exist only in the Region in which they are created
- Metrics cannot be deleted
  - They automatically expire after 15 months if no new data is published to them
  - Data points older than 15 months expire on a rolling basis
- Metrics are uniquely defined by
  - ***a name, a namespace, and zero or more dimensions***
- Each data point in a metric has
  - a time stamp
  - (optionally) a unit of measure

---

## Time Stamps

- Each metric data point must be associated with a time stamp
- It can be up to two weeks in the past and up to two hours into the future
- By default CloudWatch creates a time stamp based on the time the data point was received
- Time stamps are dateTime objects
  - For example, 2016-10-31T23:59:59Z
- P.S.:
  - CloudWatch alarms check metrics based on the current time in UTC
  - Custom metrics sent to CloudWatch with time stamps other than the current UTC time can cause alarms to display the ***Insufficient Data state*** or result in delayed alarms

---

## Metrics Retention

- CloudWatch retains metric data as follows:
  - ***high-resolution custom metrics***: Data points with a period of less than 60 seconds are available for 3 hours
  - Data points with a period of 60 seconds (1 minute) are available for 15 days
  - Data points with a period of 300 seconds (5 minute) are available for 63 days
  - Data points with a period of 3600 seconds (1 hour) are available for 455 days (15 months)
- Data Aggregation:
  - points that are initially published with a shorter period are aggregated together for long-term storage
  - For data collected using a period of 1 minute
    - Remains available for 15 days with 1-minute resolution
    - After 15 days it is aggregated and is retrievable only with a resolution of 5 minutes
    - After 63 days, it is further aggregated and is available with a resolution of 1 hour

---

## Dimensions

- A ***name/value*** pair that is part of the identity of a metric
- Up to 10 dimensions can be assigned to a metric
- Every metric has specific characteristics that describe it
  - Dimensions can be thought of as categories for those characteristics
- Dimensions help you design a structure for your statistics plan
- Dimensions are part of the unique identifier for a metric
- whenever a unique name/value pair is added to one of your metrics, a new variation of that metric is created
- AWS services that send data to CloudWatch attach dimensions to each metric
- Dimensions can be used to filter the results that CloudWatch returns
- For example: get statistics for a specific EC2 instance by specifying the ***InstanceId*** dimension when you search for metrics
- For metrics produced by certain AWS services, such as Amazon EC2, ***CloudWatch can aggregate data across dimensions***
  - For example, if you search for metrics in the AWS/EC2 namespace but do not specify any dimensions, CloudWatch aggregates all data for the specified metric to create the statistic that you requested
- CloudWatch does not aggregate across dimensions for your custom metrics

### Dimension Combinations

- Each unique combination of dimensions is treated as a separate metric, even if the metrics have the same metric name
- To retrieve statistics
  - specify the same values for the namespace, metric name, and dimension parameters that were used when the metrics were created
- One can also specify the start and end times for CloudWatch to use for aggregation

---

## Resolution

- Each metric is one of the following:
  - ***Standard resolution***, with data having a one-minute granularity
  - ***High resolution***, with data at a granularity of one second
- Metrics produced by AWS services are standard resolution by default
- For custom metric
  - can be defined as either standard resolution or high resolution
- For a high-resolution metric
  - CloudWatch stores it with a resolution of 1 second
  - Can be read and retrieved with a period of
    - 1 second
    - 5 seconds
    - 10 seconds
    - 30 seconds
    - or any multiple of 60 seconds

---

## Statistics

- Statistics are metric data aggregations over specified periods of time
- Aggregations are made using the
  - namespace
  - metric name
  - dimensions
  - and the data point unit of measure
- Minimum
  - The lowest value observed during the specified period
- Maximum
  - The highest value observed during the specified period
- Sum
  - All values submitted for the matching metric added together
- Average
  - The value of ***`Sum/SampleCount`*** during the specified period
- SampleCount
  - The count (number) of data points used for the statistical calculation.
- pNN.NN
  - The value of the specified percentile
  - You can specify any percentile, using up to two decimal places (for example, p95.45)
  - Not available for metrics that include any negative values
