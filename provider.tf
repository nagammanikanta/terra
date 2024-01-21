terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "5.12.0"
    }
  }
}

provider "google" {
 project   = var.project
  region      = var.region
  zone       = var.zone
}


provider "google" {
  project     = "leafy-summer-405104"
  region      = "us-central1"
  credentials = file("manikey.json")
}