output "parameter_arns" {
    value = ["${aws_ssm_parameter.this.*.arn}"]
}

output "parameter_names" {
    value = ["${aws_ssm_parameter.this.*.name}"]
}

output "parameter_type" {
    value = ["${aws_ssm_parameter.this.*.type}"]
}
