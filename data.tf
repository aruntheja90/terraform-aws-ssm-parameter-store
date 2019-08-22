data "aws_caller_identity" "current" {}

data "aws_region" "current" {}

data "aws_kms_key" "kms_key" {
  key_id = "${var.kms_key_id}"
}
