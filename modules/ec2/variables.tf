variable "instance_type" {
  description = "EC2 instance type"
  type        = string

  validation {
    condition     = can(regex("^(t2|t3)", var.instance_type))
    error_message = "instance_type must start with t2 or t3"
  }
}

variable "ami_id" {
  description = "AMI ID"
  type        = string

  validation {
    condition     = can(regex("^ami-", var.ami_id))
    error_message = "ami_id must start with ami-"
  }
}

variable "associate_public_ip" {
  description = "Attach a public IP"
  type        = bool
  default     = true
}

variable "tags" {
  type    = map(string)
  default = {}
}

variable "subnet_id" {
  description = "Subnet ID where EC2 will be deployed"
  type        = string
}

variable "security_group_ids" {
  description = "List of security group IDs"
  type        = list(string)
  default     = []
}
