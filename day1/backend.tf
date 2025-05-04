# terraform {
#   backend "s3" {
#     bucket         = "state-bucket-586794467501"       
#     key            = "state-file" 
#     region         = "us-east-1"                 
#     encrypt        = true                         
#     dynamodb_table = "terraform-locks"             
#   }
# }
