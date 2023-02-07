terraform {
  required_version = ">= 1.0.0, < 2.0.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

provider "aws" {
  region = "eu-west-2"
}

module "web-server-cluster" {
  source = "github.com/arnoutc/terraform-modules//services/web-server-cluster?ref=v0.0.7"

  ami = "ami-0d09654d0a20d3ae2" #Redhat Enterprise Linux 9 (64 bit X86)
  server_text = "Hello, Ubuntu 9 Here for Stage!"

  # (parameters hidden for clarity)

  cluster_name            = var.cluster_name
  db_remote_state_bucket  = var.db_remote_state_bucket
  db_remote_state_key     = var.db_remote_state_key
  region                  = var.region

  instance_type = "t2.micro"
  min_size      = 2
  max_size      = 2
  enable_autoscaling = false

  custom_tags = {
    Owner       = "team-pacator"
    DeployedBy  = "terraform"
  }
}

resource "aws_security_group_rule" "allow_testing_inbound" {
  type              = "ingress"
  security_group_id = module.web-server-cluster.alb_security_group_id

  from_port   = 12345
  to_port     = 12345
  protocol    = "tcp"
  cidr_blocks = ["0.0.0.0/0"]
}