terraform {
  backend "s3" {
    bucket         = "state-bucket-586794467501"       
    key            = "state-file/${var.environment}" 
    region         = var.region               
    encrypt        = true                         
    dynamodb_table = "terraform-locks"   
    profile = "nayra"          
  }
}