resource "aws_iam_group" "test_group" {
  name = var.group_name
}

resource "aws_iam_policy" "test_policy" {
  name        = "${var.group_name}_policy"
  description = "Policy for frontend developers"
  policy      = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect   = "Allow",
        Action   = [
          "s3:ListBucket",
          "s3:GetObject",
          "s3:PutObject",
          "s3:DeleteObject"
        ],
        Resource = [
          "arn:aws:s3:::my-frontend-app-bucket",
          "arn:aws:s3:::my-frontend-app-bucket/*"
        ]
      },
      {
        Effect   = "Allow",
        Action   = [
          "logs:DescribeLogGroups",
          "logs:DescribeLogStreams",
          "logs:GetLogEvents"
        ],
        Resource = "*"
      },
      {
        Effect   = "Allow",
        Action   = "execute-api:Invoke",
        Resource = "arn:aws:execute-api:us-east-1:123456789012:my-api-id/*"
      },
      {
        Effect   = "Allow",
        Action   = [
          "cloudfront:GetDistribution",
          "cloudfront:UpdateDistribution",
          "cloudfront:CreateInvalidation"
        ],
        Resource = "*"
      }
    ]
  })
}

resource "aws_iam_group_policy_attachment" "test_group_attachment" {
  group      = aws_iam_group.test_group.name
  policy_arn = aws_iam_policy.test_policy.arn
}