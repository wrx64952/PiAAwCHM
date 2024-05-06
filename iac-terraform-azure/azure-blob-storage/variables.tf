variable "resource_group_name" {
  type    = string
  default = "example-resources"
}

variable "resource_group_location" {
  type    = string
  default = "West Europe"
}

variable "storage_account_name" {
  type    = string
  default = "examplestoraccount"
}

variable "storage_account_account_tier" {
  type    = string
  default = "Standard"
}

variable "storage_account_account_replication_type" {
  type    = string
  default = "LRS"
}

variable "storage_account_environment" {
  type    = string
  default = "staging"
}

variable "storage_container_name" {
  type    = string
  default = "vhds"
}

variable "storage_container_container_access_type" {
  type    = string
  default = "private"
}

variable "storage_blob_name" {
  type    = string
  default = "example-blob-name"
}

variable "storage_blob_storage_account_name" {
  type    = string
  default = "example-storage-account-name"
}

variable "storage_blob_storage_container_name" {
  type    = string
  default = "example-storage-container-name"
}
