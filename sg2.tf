resource "aws_security_group" "allow_tls2_0" {
  name        = "allow_tls2_0"
  description = "Allow TLS inbound traffic"
  vpc_id      = "vpc-04c01beec08b0c80d"

  ingress {
    description = "TLS from VPC"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["172.16.0.0/16"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name                 = "allow_tls"
    yor_name             = "allow_tls2_0"
    yor_trace            = "3aae13a2-7efa-4e5d-bc33-1523e5431134"
    git_commit           = "5e981e6b1d49d0b2435ca1234033d9da772f6936"
    git_file             = "sg2.tf"
    git_last_modified_at = "2023-12-11 18:08:46"
    git_last_modified_by = "87660195+sreerajnair95@users.noreply.github.com"
    git_modifiers        = "87660195+sreerajnair95"
    git_org              = "sreerajnair95"
    git_repo             = "sreerajnair95"
  }
}
