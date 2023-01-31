terraform {
  required_version = ">= 1.0.0, < 2.0.0"

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

resource "aws_db_instance" "example" {
    identifier_prefix = "pacator"
    engine = "postgres"
    allocated_storage = 10
    instance_class = "db.t3.micro"
    db_name = var.db_name
    username =  var.db_username
    skip_final_snapshot = true

    # Retrieve password from AWS Secrets Manager
    password = data.aws_secretsmanager_secret_version.db_password.secret_string
    //password = var.db_password #You need to initially use a TFVARS environment variable
}

# AWS Secrets Manager leads to error msg: "Error: updating RDS DB Instance (pacator20230130214745025400000001): 
# operation error RDS: ModifyDBInstance, https response error StatusCode: 400, RequestID: 
# 1fe40481-8904-426d-8a1c-d95105deba80, api error InvalidParameterValue: The parameter 
# MasterUserPassword is not a valid password because it is longer than 128 characters."

data "aws_secretsmanager_secret_version" "db_password" {
  secret_id = "dev_postgres"

}

