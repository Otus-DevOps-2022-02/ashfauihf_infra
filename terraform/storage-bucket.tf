terraform {
 backend "s3" {
    endpoint   = "storage.yandexcloud.net"
    bucket     = "storage-backet"
    region     = "ru-central1"
    key        = "terraform.tfstate"
    access_key = "YCAJEZP2RUhtNBFtwj1qH84e5"
    secret_key = "YCNLqNe_lX3vd2C1en-diUEvFzfPL78P4BbSiqeh"

    skip_region_validation      = true
    skip_credentials_validation = true
 }
}
