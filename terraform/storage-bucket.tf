#terraform {
  #required_providers {
    #yandex = {
     # source = "yandex-cloud/yandex"
    #}
  #}
 backend "s3" {
    endpoint   = "storage.yandexcloud.net"
    bucket     = "storage-backet"
    region     = "ru-central1"
    key        = "terraform.tfstate"

    skip_region_validation      = true
    skip_credentials_validation = true
  }
}

provider "yandex" {
  token     = "AQAAAAAf1LcMAATuwdh9T_fk7U_7oRISc4znA5U"
  cloud_id  = "b1gluqn84cqgcm88c231"
  folder_id = "b1gp43annqsmtvmv5lmn"
  zone      = "ru-central1-a"
}
