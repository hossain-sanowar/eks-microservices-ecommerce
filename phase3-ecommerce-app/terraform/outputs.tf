output "cluster_name" {
  value = module.eks.cluster_name
}

output "region" {
  value = var.region
}

output "vpc_id" {
  value = module.vpc.vpc_id
}

output "configure_kubectl" {
  description = "Run this to point kubectl at the new cluster"
  value       = "aws eks update-kubeconfig --name ${module.eks.cluster_name} --region ${var.region}"
}

output "lb_controller_role_arn" {
  description = "IAM role for the AWS Load Balancer Controller service account"
  value       = module.lb_controller_irsa.iam_role_arn
}
