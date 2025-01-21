terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "6.14.1"
    }
  }
}

provider "google" {
  credentials = file(var.credentials)
  project     = var.project
  region      = var.region
}

resource "google_storage_bucket" "deng-test" {
  name          = "stellar-day-445214-e5_demo-bucket"
  location      = var.region
  force_destroy = true

  # Optional, but recommended settings:
  storage_class = "STANDARD"
  uniform_bucket_level_access = true

  versioning {
    enabled     = true
  }

  lifecycle_rule {
    condition {
      age = 1
    }
    action {
      type = "Delete"
    }
  }
}

resource "google_bigquery_dataset" "dataset" {
  dataset_id = "koray_test"
  project    = var.project
  location   = var.region
}
