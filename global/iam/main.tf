provider "aws" {
  region = "eu-west-2"
}

# Loop using for_each
resource "aws_iam_user" "example" {
    for_each = toset(var.user_names)
    name = each.value
}

resource "null_resource" "example" {}