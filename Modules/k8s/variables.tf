variable "AZ" {
    type = string
    default = "us-east-1" 
}

variable "cluster_name" {
    type = string
    default = "my-cluster"
  
}

variable "cluster_version" {
    type = string
    default = "1.32"
  
}
variable "instances_type" {
    type = string
    default = "t3.large"
  
}

variable "desired_size" {
    description = "number of nodes desired"
    type = number
    default = 2
  
}


  


