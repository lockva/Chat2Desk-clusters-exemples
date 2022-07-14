provider "google" {
  project = "chat2desk-cluster"
  credentials = file("C:\Users\Usuario\Documents\chat2desk-cluster-07abfe7947ae.json")
  region = "us-central1"
  zone = "us-central1-c"
}

resource "google_container_cluster" "primary" {
  name = var.cluster_name
  location = "us-central1-c"
  initial_node_count = 2

  node_pool {
    autoscaling {
      max_node_count = 4
      min_node_count = 2
    }
  }

  node_config {

    machine_type = var.machine_type

    oauth_scopes = [
      "http://www.google.apis.com/auth/loggin.write"
      "http://www.google.apis.com/auth/monitoring"

    ]

  labels = {
    node = "label-chat2desk"
  }
  
  tags = [
    "exemple-terraform-cluster"]
  
  }
}