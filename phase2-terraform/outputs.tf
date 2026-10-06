output "alb_dns_name" {
  description = "Open this address in the browser"
  value       = "http://${aws_lb.web.dns_name}"
}

output "instance_ids" {
  description = "Web server instance IDs per availability zone"
  value       = { for k, i in aws_instance.web : k => i.id }
}

output "s3_bucket" {
  description = "Name of the assets bucket"
  value       = aws_s3_bucket.assets.bucket
}
