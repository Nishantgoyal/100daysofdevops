# How IAM Works

![IAM Architecture Diagram](https://docs.aws.amazon.com/IAM/latest/UserGuide/images/intro-diagram%20_policies_800.png)
[Understanding how IAM Works](https://docs.aws.amazon.com/IAM/latest/UserGuide/intro-structure.html)

## Terms

- Resources
  - These are objects that are stored in IAM
  - It includes:
    - user
    - group
    - role
    - policy
    - identity provider objects
  - These can be added, edited, and removed from IAM
- Identities
  - These are resources that are used to identify and group
  - It includes:
    - users
    - groups
    - roles
  - Policies are attached to IAM identities
- Entities
  - These are resources that AWS uses for authentication
  - These include
    - IAM users
    - federated users
    - assumed IAM roles
- Principals
  - It refers to a person or application that uses the AWS account to make requests to AWS
  - It is authenticated as the AWS account root user or an IAM entity

## Request

- When a principal tries to use the AWS Management Console, the AWS API, or AWS CLI, it sends a `request` to AWS
- The `request` includes the following information
  - Actions or Operations
  - Resources
    - AWS object upon which the actions or operations are performed
  - Principal
    - The person or application that used an entity to send the request
    - Includes the policies that are associated with the entity that the principal used to sign in
  - Environment data
    - Information about
      - IP address
      - User agent
      - SSL enabled status
      - time
      - etc
  - Resource data
    - e.g., DynamoDB table name or Amazon EC2 instance
- AWS gathers the request information into a `request context`

## Authentication

- A principal must be authenticated (signed in to AWS) using their credentials to send a request to AWS

## Authorization

- AWS uses values from the request context to check for policies that apply to the request
- It then determines whether to allow or deny the request
- Policies are stored in AWS as `JSON documents`
- Policies specify permissions for principal entities
- Policy Types:
  - Identity-based policies
    - Provide users with permissions to access the AWS resources in their own account
  - Resource-based policies
    - Popular for granting `cross-account access`
- AWS checks each policy that applies to the context
- If any policy includes a denied action, AWS denies the entire request
- This is called an explicit deny
- AWS authorized the request only if every part of the request is allowed by the applicable permissions policies
- [Policy evaluation logic](https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_policies_evaluation-logic.html)

## Actions or Operations

- Operations are defined by a service
- It include things that you can do to a resource, such as
  - viewing
  - creating
  - editing
  - deleting
- To allow a principal to perform an operation, include the necessary action in a policy that applies to the principal or the affected resource

## Resources

- A resource is an object that exists withtin a service
- The service defines a set of actions that can be performed on each resource
