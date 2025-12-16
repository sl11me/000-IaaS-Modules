variable "instance_type" {
  description = "Type EC2"
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
