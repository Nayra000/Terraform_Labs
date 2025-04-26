resource "aws_lambda_function" "hello_lambda" {
  function_name = "hello-world"
  handler       = "lambda_function.lambda_handler"
  runtime       = "python3.9"
  filename      = "lambda.zip"
  source_code_hash = filebase64sha256("lambda.zip")

  role = aws_iam_role.lambda_role.arn
}

resource "aws_iam_role" "lambda_role" {
  name = "lambda_execution_role"

  assume_role_policy = jsonencode({
    Statement = [{
      Effect    = "Allow"
      Principal = { Service = "lambda.amazonaws.com" }
      Action    = "sts:AssumeRole"
    }]
  })
}
