variable "bucket" {
    description = "Bucket to use as backend"
    type = string
    default = "pacator-terraform-state"
}

variable "dynamodb" {
    description = "DynamoDB table used for state locking"
    type = string
    default = "pacator-terraform-state-locks"
}

variable "region" {
    description = "Region used for state file"
    type = string
    default = "eu-west-2"
}
