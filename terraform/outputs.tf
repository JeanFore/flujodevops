output "ec2_instance_id" {
  description = "EC2 instance ID."
  value       = aws_instance.backend.id
}

output "ec2_public_ip" {
  description = "Public IP to use as GitHub secret EC2_INSTANCE."
  value       = aws_instance.backend.public_ip
}

output "ec2_public_dns" {
  description = "Public DNS name to use as GitHub secret EC2_INSTANCE."
  value       = aws_instance.backend.public_dns
}

output "ec2_user" {
  description = "GitHub secret EC2_USER."
  value       = "ec2-user"
}

output "ec2_deploy_path" {
  description = "GitHub secret EC2_DEPLOY_PATH."
  value       = var.deploy_path
}

output "backend_url" {
  description = "Backend URL after GitHub Actions deploys the app."
  value       = "http://${aws_instance.backend.public_dns}:${var.backend_port}/"
}
