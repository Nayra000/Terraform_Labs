module "mynetwork"{
    source= "./network"
    cidr=var.vpc_cidr
    region=var.region
    subnets=var.subnets_list
}

