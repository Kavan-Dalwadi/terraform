variable "function_name" {
  
}

variable "api_name" {
  description = "API Name"
  type =  string
}

variable "api_path_part" {
  description = "value"
  type = string
}

variable "api_http_method" {
  description = "Api gateway method"
  type = string
}

variable "api_authorization" {
  description = "API Gateway Authorization"
  type =  string
}

variable "api_integration_http_method" {
  description = "API HTTP method integration"
}

variable "api_type" {
  description = "API GW Integration type"
}

variable "accountId" {
  description = "AWS Account ID"
}

variable "aws_region" {
  description = "AWS default region."
  type =  string
}

variable "statement_id" {
  description = "IAM statement ID"
}

variable "action" {
  description = "IAM Lambda Description"
}

variable "principal" {
  description = "IAM Lambda Principal"
}
