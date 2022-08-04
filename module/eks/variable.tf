variable "cluster_config" {
  type = object({
    name    = string
    version = string
  })
  default = {
    name    = "eks-cluster"
    version = "1.22"
  }
}

variable "role_arn" {
  
}

variable "public_subnets_id" {
  
}

variable "private_subnets_id" {
  
}

variable "security_group_id" {
  
}

variable "node_role_arn" {
  
}