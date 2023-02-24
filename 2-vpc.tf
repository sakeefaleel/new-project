resource "google_project_service" "compute" {
  service = "compute.googleapis.com"
}

resource "google_project_service" "container" {
  service = "container.googleapis.com"
}

# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_network
resource "google_compute_network" "main" {
  name                    = "my_vpc"
  auto_create_subnetworks = false
  delete_default_routes_on_create = false
  project                 = var.project
  routing_mode            = "REGIONAL"

  depends_on = [
    google_project_service.compute,
    google_project_service.container
  ]
}
