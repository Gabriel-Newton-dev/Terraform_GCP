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
# [START vpc_static_route_create]
module "google_compute_route" {
  source       = "terraform-google-modules/network/google//modules/routes"
  version      = "~> 6.0"
  project_id   = var.project_id # Replace this with your project ID in quotes
  network_name = "default"

  routes = [
    {
      name              = "egress-internet"
      description       = "route through IGW to access internet"
      destination_range = "0.0.0.0/0"
      tags              = "egress-inet"
      next_hop_internet = "true"
    }
  ]
}
# [END vpc_static_route_create]