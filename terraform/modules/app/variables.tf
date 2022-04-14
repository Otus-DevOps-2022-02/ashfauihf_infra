variable "zone" {
  description = "Zone"
  default = "ru-central1-a"
}
variable "public_key_path" {
  description = "Path to the public key used for ssh access"
}
variable app_disk_image {
  description = "Disk image for reddit db"
  default = "reddit-app-base"
}
variable "subnet_id" {
  description = "Subnet"
}
