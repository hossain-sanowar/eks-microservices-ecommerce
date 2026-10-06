# Latest Ubuntu 22.04 AMI instead of a hard-coded AMI ID
data "aws_ami" "ubuntu" {
  most_recent = true
  owners      = ["099720109477"] # Canonical

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }
}

resource "aws_instance" "web" {
  for_each = aws_subnet.public

  ami                    = data.aws_ami.ubuntu.id
  instance_type          = var.instance_type
  subnet_id              = each.value.id
  vpc_security_group_ids = [aws_security_group.web.id]

  # One template for all servers; only the server name differs
  user_data = templatefile("${path.module}/userdata.sh.tftpl", {
    server_name = "web-${each.key}"
  })

  # Enforce IMDSv2 (session tokens for the instance metadata service)
  metadata_options {
    http_tokens   = "required"
    http_endpoint = "enabled"
  }

  tags = { Name = "${var.project}-web-${each.key}" }
}
