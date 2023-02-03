provider "aws" {
  region = "eu-west-2"
}

# Loop using count
# resource "aws_iam_user" "example" {
#     count = length(var.user_names)
#     name = var.user_names[count.index]
# }

# Loop using for_each
resource "aws_iam_user" "example" {
    for_each = toset(var.user_names)
    name = each.value
}