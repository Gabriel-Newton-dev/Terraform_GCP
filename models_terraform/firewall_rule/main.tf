terraform {
  required_version = ">=0.12.6"

  required_providers {
    google = {
      version = "~> 4.0"
    }
    null = {
      version = "~> 3.0"
    }
  }
}
# [START vpc_firewall_create]
resource "google_compute_firewall" "rules"{
    projetc = var.project_id
    name = var.firewall_name
    network     = "default"
    description = "Creates firewall rule targeting tagged instances"

    allow {
    protocol = "tcp"
    ports    = ["80", "8080", "1000-2000"]
    }
    target_tags = ["web"]
}

# [END vpc_firewall_create]