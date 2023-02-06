## Required Inputs

* `cert_arn` - ARN of the AWS ACM Certificate you want to use
* `container_definition` - JSON-encoded map of your container parameters
* `domain_name` - Domain name for your LB alias
* `name` - Name of your app (defines the service name and DNS server name)
* `subnet_ids` - List of Subnet IDs to locate your LB and Fargate app within (at least 2 required)
* `vpc_id` - VPC ID containing the aforementioned subnets
