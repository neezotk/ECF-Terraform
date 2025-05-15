variable "function_name" {
  type = string
  default = "my-function"
}

variable "description" {
    type = string
    default = "My awesome lambda function"
}

variable "handler" {
    type = string
    default = "index.lambda_handler"
}

variable "runtime" {
    type = string
    default = "java17"
}

variable "function_path" {
    type = string
    default = "../Modules/lambda/build/lambda-function.zip"
  
}