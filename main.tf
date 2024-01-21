
resource "google_storage_bucket" "gcs-bucket-cs" {
  name          =var.gcs-bucket-cs
  location      = var.location
  
  force_destroy = true

  lifecycle_rule {
    condition {
      age = 5
    }
    action {
      type = "Delete"
    }
  }

  lifecycle_rule {
    condition {
      age = 1
    }
    action {
      type = "AbortIncompleteMultipartUpload"
    }
  }
}
resource "google_service_account""sa-terra-tf" {
 account_id = var.sa_terra_account_id
 display_name = var.sa_terra_display_name

  
}
resource "google_compute_network""custom-vpc-tf"{
  name = var.custom-vpc-tf
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "custom-subnet-tf" {
  name = var.custom-subnet-tf
  ip_cidr_range = var.ip_cidr_range
  region = var.region
  network = google_compute_network.custom-vpc-tf.id
  
}


resource "google_compute_instance" "tf-instance-abc" {
  name         = var.tf-instance-abc
  machine_type = var.machine_type
  zone         = var.zone

  boot_disk {
    initialize_params {
      image = var.image
    }
  }

  network_interface {
    network = google_compute_network.custom-vpc-tf.id
      subnetwork = google_compute_subnetwork.custom-subnet-tf.id
    
   access_config {
      // Ephemeral IP
    }
  }
}

resource "google_container_cluster" "primary-cluster-tf" {
  name     = var.primary-cluster-tf
  location = var.zone


  # We can't create a cluster with no node pool defined, but we want to only use
  # separately managed node pools. So we create the smallest possible default
  # node pool and immediately delete it.
  remove_default_node_pool = var.node_config
  initial_node_count       = var.node_count
  deletion_protection = false
  
}

resource "google_container_node_pool" "primary_preemptible_nodes" {
  name       = var.primary_preemptible_nodes
  location = var.zone
  cluster    = google_container_cluster.primary-cluster-tf.name
  node_count = var.node_count
  

  node_config {
    preemptible  = var.node_config
    machine_type = var.machine_type
   
    

    # Google recommends custom service accounts that have cloud-platform scope and permissions granted via IAM Roles.
    service_account = google_service_account.sa-terra-tf.email
    oauth_scopes    = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]
  }
}

