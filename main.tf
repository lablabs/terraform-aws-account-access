resource "aws_iam_group" "default" {
  name = module.label.id
}

resource "aws_iam_group_membership" "default" {
  name  = module.label.id
  group = aws_iam_group.default.id
  users = var.user_names
}

data "aws_iam_policy_document" "with_mfa" {
  count = "${var.require_mfa ? 1 : 0}"

  statement {
    actions = [
      "sts:AssumeRole",
    ]

    resources = var.role_arns

    condition {
      test     = "Bool"
      variable = "aws:MultiFactorAuthPresent"
      values   = ["true"]
    }

    effect = "Allow"
  }
}

resource "aws_iam_group_policy" "with_mfa" {
  count  = "${var.require_mfa ? 1 : 0}"
  name   = module.label.id
  group  = aws_iam_group.default.id
  policy = data.aws_iam_policy_document.with_mfa[count.index].json
}

data "aws_iam_policy_document" "without_mfa" {
  count = "${var.require_mfa ? 0 : 1}"

  statement {
    actions = [
      "sts:AssumeRole",
    ]

    resources = var.role_arns

    effect = "Allow"
  }
}

resource "aws_iam_group_policy" "without_mfa" {
  count  = "${var.require_mfa ? 0 : 1}"
  name   = module.label.id
  group  = aws_iam_group.default.id
  policy = data.aws_iam_policy_document.without_mfa[count.index].json
}
