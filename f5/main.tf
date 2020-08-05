# Terraform Version Pinning
terraform {
  required_version = ">= 0.12.26"
  required_providers {
    google = "~> 3.24.0"
  }
}

# Google Provider
provider google {
  project = var.project
  region  = var.region
  zone    = var.zone
}