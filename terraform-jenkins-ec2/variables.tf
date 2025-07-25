variable "aws_region" {
  default = "ap-south-1"
}

variable "ami_id" {
  description = "Amazon Linux 2 or Ubuntu AMI ID for ap-south-1"
  default     = "ami-0f58b397bc5c1f2e8"  
}

variable "key_name" {
  description = "Your existing EC2 Key Pair name"
  default     = "TrendStore"  
}

