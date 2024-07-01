variable "region" {
  description = "AWS region"
  type        = string
  default     = "eu-west-1"
}
variable "name" {
  description = "Name of the project"
  type        = string
}
variable "vpc_id" {
  description = "ID of your current VPC network"
  type        = string
}

variable "vpc_subnet_ids" {
  description = "Subnet ids"
  type        = set(string)
}

variable "instance_type" {
  description = "Instance type"
  type        = string
  default     = "kafka.t3.small"
}
variable "instance_volume_size" {
  description = "Instance volume size"
  type        = number
  default     = 100
}
variable "storage_mode" {
  description = "Storage Mode"
  type        = string
  default     = "LOCAL" # LOCAL,TIERED
}
variable "kafka_version" {
  description = "Version of the clsuter"
  type        = string
  default     = "3.6.0"
}
variable "number_of_broker_nodes" {
  description = "Numbers of broker nodes, always deveid with your zone, eg. 3 zone = 3, 6, 9 and so of broker nodes."
  type        = number
  default     = 3
}
variable "public_access" {
  description = "Numbers of broker nodes, always deveid with your zone, eg. 3 zone = 3, 6, 9 and so of broker nodes."
  type        = string
  default     = "DISABLED" # first use SERVICE_PROVIDED_EIPS after the cluster is created.
}

