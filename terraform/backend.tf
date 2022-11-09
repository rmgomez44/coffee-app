terraform {
  backend "s3" {
    bucket  = "coffee-web-450213392530"
    key     = "terraform-state"
    region  = "us-east-1"
    encrypt = true
    dynamodb_table = "coffee-web-terraform-lock"
  }
}
