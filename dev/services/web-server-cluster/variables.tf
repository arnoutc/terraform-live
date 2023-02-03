
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
  default       = "dev/data-stores/postgres/terraform.tfstate"
}

# ---------------------------------------------------------------------------------------------------------------------
# OPTIONAL PARAMETERS
# These parameters have reasonable defaults.
# ---------------------------------------------------------------------------------------------------------------------

variable "cluster_name" {
  description = "The name to use to namespace all the resources in the cluster"
  type        = string
  default     = "webservers-dev"
}

variable "region" {
    description = "Region used for state file"
    type = string
    default = "eu-west-2"
}

variable "names" {
  description = "A list of names"
  type = list(string)
  default = ["neo", "trinity", "morpheus"]
}

variable "hero_thousand_faces" {
description = "map"
type = map(string)
default = {
neo = "hero"
trinity = "love interest"
morpheus = "mentor"
}
}