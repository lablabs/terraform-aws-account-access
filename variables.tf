# General Settings
variable "namespace" {
  type        = string
  default     = ""
  description = "Namespace, which could be your organization name or abbreviation, e.g. 'eg' or 'cp'"
}

variable "environment" {
  type        = string
  default     = ""
  description = "Environment, e.g. 'prod', 'staging', 'dev', 'pre-prod', 'UAT'"
}

variable "name" {
  type        = string
  default     = ""
  description = "Solution name, e.g. 'app' or 'jenkins'"
}

variable "tags" {
  type        = map(string)
  default     = {}
  description = "Additional tags (e.g. `map('BusinessUnit','XYZ')`"
}

# Access Group
variable "user_names" {
  type        = "list"
  description = "A list of IAM User names to associate with the Group"
}

variable "role_arns" {
  type        = "list"
  description = "The name of the Role in the member account to grant permissions to the users in the Group"
}

variable "require_mfa" {
  type        = "string"
  default     = true
  description = "Require the users to have MFA enabled"
}
