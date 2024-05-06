terraform {
  backend "local" {
    path = "./terraform.tfstate"
  }
}


resource "local_file" "powitanie" {
  content  = var.wiadomosc
  filename = var.plik
}
