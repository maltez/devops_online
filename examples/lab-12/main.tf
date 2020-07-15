module "names" {
  source = "./random_module"
  random_uid_count = terraform.workspace == "prod" ? 5 : 2
  pet_name_length = 5
  random_string_length = 15
}

resource "random_string" "temp" {
  length = 5
}

resource "random_uuid" "custom" {
  count = terraform.workspace == "prod" ? 1 : 0
}

output "temp" {
  value = module.names.container_name
}