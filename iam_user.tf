resource "aws_iam_user" "test_user" {
  name = var.user_name
}

resource "aws_iam_user_group_membership" "test_user_group_membership" {
  user  = aws_iam_user.test_user.name
  groups = [aws_iam_group.test_group.name]
}