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
  default       = "prod/data-stores/postgres/terraform.tfstate"
}

# ---------------------------------------------------------------------------------------------------------------------
# OPTIONAL PARAMETERS
# These parameters have reasonable defaults.
# ---------------------------------------------------------------------------------------------------------------------

variable "server_text" {
  description = "The text the web server should return"
  default     = "Prod Hello, World"
  type        = string
}

variable "environment" {
  description = "The name of the environment we're deploying to"
  type        = string
  default     = "prod"
}