variable cidr {
  type        = string
  description = "cidr block of vpc"
}

variable region {
  type        = string
  default     = "us-east-1"
}

variable subnets {
  type        = list(object({
    name=string,
    cidr=string,
    az=string,
    type=string
  }))

}
