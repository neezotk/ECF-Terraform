provider "aws" {
  region     = "us-east-1"
  access_key = "XXXXXXXXXXXXXX"
  secret_key = "XXXXXXXXXXXXXX"
}

module "k8s" {
  source = "../Modules/k8s"
  
}