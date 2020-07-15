resource "random_string" "container_name" {
  length  = var.random_string_length
  special = false
  number  = false
  upper   = false
}

resource "random_pet" "container_name1" {
  length = var.pet_name_length
}


resource "random_integer" "container_name2" {
  max = 256
  min = 0
}

resource "random_uuid" "container_name3" {
  count = var.random_uid_count
}

output "container_name" {
  value = random_string.container_name.result
}
