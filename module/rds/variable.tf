variable "allocated_storage"{
    description = "RDS Allocated Storage"
    type = number
    default = 30
}

variable "engine"{
    description = "RDS Engine type"
    type = string
    default = mysql
}

variable "engine_version"{
    description = "RDS Engine Version"
    type = number
    default = 5.7
}

variable "instance_class"{
    description = "RDS Engine Version"
    type = string
    default = "db.t3.micro"
}

variable "name"{
    description = "RDS Engine Version"
    type = string
    default = "mydb"
}

variable "parameter_group_name"{
    description = "RDS Engine Version"
    type = string
    default = "default.mysql5.7"
}

variable "skip_final_snapshot"{
    description = "RDS Engine Version"
    type = bool
    default = true
}
