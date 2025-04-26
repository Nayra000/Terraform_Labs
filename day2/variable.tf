variable "environment" {
    type = string
    default = ""

}
variable "region" {
    type = string
    default = ""
}
variable "instance_type" {
    type = string
    default = ""
}

variable "cider_block" {
    type = string
    default = ""
}

variable "profile" {
    type = string
    default = "default"
}


variable "subnets_list" {
    type = list(object({
        name = string ,
        cider_block = string ,
        az = string ,
        type = string
   
  }))
}

variable "db_engine" {
    type = string
}

variable "db_identifier" {
    type = string
}
variable "db_instance_class" {
    type = string
}
variable "db_allocated_storage" {
    type = string
}
variable "db_name" {
    type = string
}
variable "db_username" {
    type = string
}
variable "db_password" {
    type = string
}


variable "redis_cluster_id" {
    type = string
}
variable "redis_engine" {
    type = string
}
variable "redis_engine_version" {
    type = string
}
variable "redis_node_type" {
    type = string
}
variable "redis_num_cache_nodes" {
    type = number
}
variable "redis_parameter_group_name" {
    type = string
}