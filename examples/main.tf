module "this" {
  source         = "../"
  product_domain = "pay"
  environment    = "staging"
  service_name   = "paytest"
  role_names     = ["MidasDev"]
  kms_key_id     = "alias/aws/ssm"

  parameter_names = {
    name1 = "description1"
    name2 = "description2"
  }
}
output "name" {
  value = "${module.this.parameter_names}"
}
