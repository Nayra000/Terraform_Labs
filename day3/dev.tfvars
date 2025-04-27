environment = "dev"

region      = "us-east-1"

vpc_cidr="10.0.0.0/16"

subnets_list=[
{
    name="public_subnet1",
    cidr="10.0.1.0/24",
    az="us-east-1a",
    type="public"
},
{
    name="public_subnet2",
    cidr="10.0.3.0/24",
    az="us-east-1b",
    type="public"
},
{
    name="private_subnet1",
    cidr="10.0.2.0/24",
    az="us-east-1a",
    type="private"
},
{
    name="private_subnet2",
    cidr="10.0.4.0/24",
    az="us-east-1b",
    type="private"
}


]