variable "aws_access_key" {
  description = "AWS access key ID used by Terraform."
  type        = string
  sensitive   = true
}

variable "aws_secret_key" {
  description = "AWS secret access key used by Terraform."
  type        = string
  sensitive   = true
}

variable "aws_region" {
  description = "AWS region where the EC2 instance will be created."
  type        = string
  default     = "us-east-1"
}

variable "project_name" {
  description = "Prefix used for AWS resource names and tags."
  type        = string
  default     = "ai4devs-scdf"
}

variable "owner" {
  description = "Owner tag value."
  type        = string
  default     = "SCDF"
}

variable "instance_type" {
  description = "EC2 instance type. t2.micro is usually eligible for the free tier in supported accounts/regions."
  type        = string
  default     = "t2.micro"
}

variable "ssh_key_name" {
  description = "Name for the AWS EC2 key pair created from ssh_public_key."
  type        = string
  default     = "ai4devs-scdf-deploy-key"
}

variable "ssh_public_key" {
  description = "Public SSH key content. Keep the matching private key as the GitHub secret EC2_SSH_KEY."
  type        = string
}

variable "ssh_allowed_cidrs" {
  description = "CIDR blocks allowed to connect by SSH. For GitHub Actions runners this often needs 0.0.0.0/0 during the exercise."
  type        = list(string)
  default     = ["0.0.0.0/0"]
}

variable "backend_allowed_cidrs" {
  description = "CIDR blocks allowed to call the backend HTTP port."
  type        = list(string)
  default     = ["0.0.0.0/0"]
}

variable "backend_port" {
  description = "Backend port used by the Node.js app."
  type        = number
  default     = 3010
}

variable "deploy_path" {
  description = "Path where the GitHub Actions workflow deploys the backend."
  type        = string
  default     = "/home/ec2-user/ai4devs-backend"
}

variable "root_volume_size" {
  description = "Root EBS volume size in GiB."
  type        = number
  default     = 12
}
