environment = "prod"
region      = "eu-central-1"
instance_type = "t3.micro"

cider_block = "10.0.0.0/16"

profile = "nayra"

subnets_list = [
    {
        name = "public_subnet1" ,
        cider_block = "10.0.1.0/24" ,
        az = "eu-central-1a" ,
        type = "public"
    } ,
    {
        name = "public_subnet2" ,
        cider_block = "10.0.3.0/24" ,
        az = "eu-central-1b" ,
        type = "public"
    } ,
    {
        name = "private_subnet1" ,
        cider_block = "10.0.2.0/24" ,
        az = "eu-central-1a" ,
        type = "private"
    } ,
        {
        name = "private_subnet2" ,
        cider_block = "10.0.4.0/24" ,
        az = "eu-central-1b" ,
        type = "private"
    } ,


]

db_engine            = "mysql"
db_identifier        = "my-private-db"
db_instance_class    = "db.t3.micro"
db_allocated_storage = 20
db_name              = "mydatabase"
db_username          = "admin"
db_password          = "password123"

redis_cluster_id     = "my-private-redis"
redis_engine         = "redis"
redis_parameter_group_name = "default.redis7"
redis_node_type     = "cache.t3.micro"
redis_num_cache_nodes = 1
redis_engine_version = "7.0"


