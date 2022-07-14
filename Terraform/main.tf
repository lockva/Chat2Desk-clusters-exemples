provider "google" {
  project = "chat2desk-cluster"
  credentials = "${file("credentials.json")}"
  region = "us-central1"
  zone = "us-central1-c"
}

resource "google_container_cluster" "primary" {
  name = var.cluster_name
  location = "us-central1-c"
  initial_node_count = 2
}

node_pool {
  autoscaling {
    max_node_count = 4
    min_node_count = 2
  }
}

node_config {

  machine_type = var.machine_type

  labels = {
    node = "label-chat2desk"
  }
  
tags = [
  "dev-cluster-chat2desk"]
  
}
*/