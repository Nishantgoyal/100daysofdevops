# AWS IAM

- AWS Identity and Access Management is a web service that helps one securily control access to AWS resources
- IAM is used to control:
  - who is authenticated (signed in)
  - who is authorized (has permissions) to use resources

## Root User

- It is the single sign-in identity present in a new account creation
- It has complete access to all AWS services and resources in the account
- [Best Practises for root user](https://docs.aws.amazon.com/IAM/latest/UserGuide/best-practices.html#create-iam-users)

## IAM Features

- Shared access to AWS account
- Granular permissions
  - different permissions to differnt people for different resources
- Secure access to AWS resources for applications running on Amazon EC2
- Multi-factor Authentication
- Identity federation
- Identity information for assurance
  - Using `AWS CloudTrail` receive log records that include information about those who made requests for resources
- PCI DSS Compliance
  - Supports the processing, storage, and transmission of credit card data by a merchant or service provider
  - It is validated as being compliant with [Payment Card Industry (PCI) Data Security Standard (DSS)](https://aws.amazon.com/compliance/pci-dss-level-1-faqs/)
- Integrated with many AWS Services
- Eventually Consistent
- Free to use

## [How IAM Works](how_iam_works.md)
