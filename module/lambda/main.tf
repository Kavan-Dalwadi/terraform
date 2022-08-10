resource "aws_lambda_function" "lambda" {
  filename      = "lambda.zip"
  function_name = "mylambda"
  role          = var.lambdaRole.arn
  handler       = "lambda.lambda_handler"
  runtime       = "python3.7"

  source_code_hash = filebase64sha256("lambda.zip")
}
