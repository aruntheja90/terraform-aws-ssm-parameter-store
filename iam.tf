data "aws_iam_policy_document" "ssm_policy" {
  version = "2012-10-17"

  statement {
    sid = "AllowManageOwnerParams"

    actions = [
      "ssm:PutParameter",
      "ssm:DeleteParameter",
      "ssm:GetParameterHistory",
      "ssm:GetParametersByPath",
      "ssm:GetParameters",
      "ssm:GetParameter",
      "ssm:DeleteParameters",
    ]

    resources = [
      "arn:aws:ssm:${data.aws_region.current.name}:${data.aws_caller_identity.current.account_id}:parameter/${var.product_domain}/${var.service_name}/${var.environment}/*",
    ]

    effect = "Allow"
  }

  statement {
    sid = "AllowEncryptDecryptDescribe"

    actions = [
      "kms:Encrypt",
      "kms:DescribeKey",
      "kms:Decrypt",
    ]

    effect = "Allow"

    resources = [
      "${data.aws_kms_key.kms_key.arn}",
    ]
  }
}

resource "aws_iam_policy" "policy" {
  name        = "${var.service_name}-${var.environment}-parameter-store"
  description = "Policy to allow getting access to ${var.service_name}-${var.environment} ssm parameter store"
  policy      = "${data.aws_iam_policy_document.ssm_policy.json}"
}

resource "aws_iam_role_policy_attachment" "policy-attachment" {
  count      = "${length(var.role_names)}"
  role       = "${var.role_names[count.index]}"
  policy_arn = "${aws_iam_policy.policy.arn}"
}
