variable "lambdaRole" {
  description = "AWS IAM Role for Lambda"
}

variable "filename" {
  description = "lambda function file name"
  type = string
}

variable "function_name" {
  description = "lambda function name"
  type = string
}

variable "handler" {
  description = "Lambda function handler"
  type = string
}

variable "runtime" {
  description = "Lambda function runtime"
  type = string
}