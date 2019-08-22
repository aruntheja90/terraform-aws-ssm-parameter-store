resource "aws_ssm_parameter" "this" {
  count       = "${length(var.parameter_names)}"
  name        = "${var.product_domain}/${var.service_name}/${var.environment}/${element(keys(var.parameter_names), count.index)}"
  type        = "${var.type}"
  value       = "changemeplease"
  description = "${lookup(var.parameter_names, "${element(keys(var.parameter_names), count.index)}")}"
  key_id      = "${data.aws_kms_key.kms_key.id}"

  tags {
    Service       = "${var.service_name}"
    Description   = "${lookup(var.parameter_names, "${element(keys(var.parameter_names), count.index)}")}"
    Name          = "${var.product_domain}/${var.service_name}/${var.environment}/${element(keys(var.parameter_names), count.index)}"
    ProductDomain = "${var.product_domain}"
    Environment   = "${var.environment}"
    ManagedBy     = "Terraform"
  }

  lifecycle {
    ignore_changes = [
      "value",
    ]
  }
}
