terraform {
  required_version = ">= 1.3.0"
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 5.0"
    }
  }
}

provider "google" {
  project = var.project_id
  region  = var.gcp_region
}

resource "google_project_iam_custom_role" "reader" {
  role_id     = replace("${var.name_prefix}_viewer", "-", "_")
  title       = "Custom limited viewer"
  description = "practice custom role"
  permissions = [
    "storage.buckets.get",
    "storage.objects.get",
  ]
}
