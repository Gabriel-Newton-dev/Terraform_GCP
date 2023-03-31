terraform {
  required_version = ">= 0.13"
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 4.0"
    }
  }
}

resource "google_compute_instance" "default" {
  project      = var.project_id # Replace this with your project ID in quotes
  zone         = "southamerica-east1-b"
  name         = "backend-instance"
  machine_type = "e2-medium"
  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }
  network_interface {
    network = "default"
  }
  tags = ["health-check", "ssh"]
}


# module "instance_template" {
#   source          = "../../../modules/instance_template"
#   region          = var.region
#   project_id      = var.project_id
#   subnetwork      = var.subnetwork
#   service_account = var.service_account
# }
