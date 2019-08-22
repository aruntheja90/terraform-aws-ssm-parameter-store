variable "product_domain" {
  type        = "string"
  description = "Abbreviation of the product domain this parameter store"
}

variable "environment" {
  type        = "string"
  description = "Environment which this parameter belongs to"
}

variable "service_name" {
  type        = "string"
  description = "The name of service which will have access to the parameter store"
}

variable "role_name" {
  type        = "string"
  description = "IAM Role name that will granted full access to the parameter store"
}

variable "kms_key_id" {
  type        = "string"
  description = "KMS key ID that will be used for parameter store value encryption"
}

variable "parameter_names" {
  type        = "map"
  description = "Map of parameter names and it's description"

  default = {
    parameter1 = "description1"
    parameter2 = "description2"
  }
}

variable "type" {
  type = "string"
  description = "Parameter store type"
  default = "SecureString"
}
