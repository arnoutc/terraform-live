terraform {
  required_version = "= 1.3.7"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }

  backend "s3" {
    # This backend configuration is filled in automatically at test time by Terratest. If you wish to run this example
    # manually, uncomment and fill in the config below.

    # bucket         = "<YOUR S3 BUCKET>"
    # key            = "<SOME PATH>/terraform.tfstate"
    # region         = "us-east-2"
    # dynamodb_table = "<YOUR DYNAMODB TABLE>"
    # encrypt        = true
  }
}

provider "aws" {
  region = "eu-west-2"
}

module "postgres" {
  source = "../../../../modules/data-stores/postgres"

  db_name     = var.db_name
  db_username = var.db_username
  db_password = var.db_password
}