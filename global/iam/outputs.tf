# When using count
# output "neo_arn" {
#   value = aws_iam_user.example[0].arn
#   description = "The ARN for user neo"
# }

# When using count
# output "all_arns" {
#     value = aws_iam_user.example[*].arn
#     description = "The ARNs for all users"
# }

# using for_each in resource aws_iam_user
output "all_users" {
    value = aws_iam_user.example
}

# using for_each in resource aws_iam_user
output "all_arns" {
    value = values(aws_iam_user.example)[*].arn
}

