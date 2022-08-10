resource "aws_lambda_function" "lambda" {
  filename      = var.filename
  function_name = var.function_name
  role          = var.lambdaRole.arn
  handler       = var.handler
  runtime       = var.runtime

  source_code_hash = filebase64sha256("lambda.zip")
}
