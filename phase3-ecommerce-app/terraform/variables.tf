variable "region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

variable "project" {
  description = "Name prefix; also used as the EKS cluster name"
  type        = string
  default     = "eks-ecommerce"
}

variable "kubernetes_version" {
  description = "EKS Kubernetes version. Choose one in standard support (extended support costs more): aws eks describe-cluster-versions"
  type        = string
  default     = "1.34"
}

variable "vpc_cidr" {
  description = "CIDR block of the VPC"
  type        = string
  default     = "10.10.0.0/16"
}

variable "node_instance_type" {
  description = "Instance type of the managed node group"
  type        = string
  default     = "t3.medium"
}

variable "node_desired_size" {
  description = "Desired number of worker nodes"
  type        = number
  default     = 2
}
