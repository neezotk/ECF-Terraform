module "lambda_function" {
  source = "terraform-aws-modules/lambda/aws"
  function_name = var.function_name
  description   = var.description
  handler       = var.handler
  runtime       = var.runtime

  create_package         = false
  local_existing_package = var.function_path

}