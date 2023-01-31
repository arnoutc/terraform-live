
# ---------------------------------------------------------------------------------------------------------------------
# REQUIRED PARAMETERS
# You must provide a value for each of these parameters.
# ---------------------------------------------------------------------------------------------------------------------

variable "db_remote_state_bucket" {
  description   = "The name of the S3 bucket used for the database's remote state storage"
  type          = string
  default       = "pacator-terraform-state"
}

variable "db_remote_state_key" {
  description   = "The name of the key in the S3 bucket used for the database's remote state storage"
  type          = string
  default       = "stage/data-stores/postgres/terraform.tfstate"
}

# ---------------------------------------------------------------------------------------------------------------------
# OPTIONAL PARAMETERS
# These parameters have reasonable defaults.
# ---------------------------------------------------------------------------------------------------------------------

variable "cluster_name" {
  description = "The name to use to namespace all the resources in the cluster"
  type        = string
  default     = "webservers-stage"
}

variable "region" {
    description = "Region used for state file"
    type = string
    default = "eu-west-2"
}