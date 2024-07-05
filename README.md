# Amazon Managed Streaming for Apache Kafka (MSK)

This module help you to quick to get up and running with AWS MSK (Amazon Managed Streaming for Apache Kafka) using AWS IAM.

Default AWS MSK is running on version 3.7.x with Kraft and instance type kafka.m7g.large, mounth price cost around 460$, if you need a development setup or cheaper you shoud not use Kraft but Zookeeper and kafka.t3.small instance, just remeber you can change Zookeeper to Kraft later.