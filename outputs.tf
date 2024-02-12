
output "instance" {
  value = google_compute_instance.tf-instance-abc.name
  sensitive = true
  
}

output "custom-vpc" {
    value = google_compute_network.custom-vpc-tf.name
   sensitive = true
}

output "subnet" {
    value = google_compute_subnetwork.custom-subnet-tf.name
   sensitive = true
}
output "ip" {
    value = google_compute_subnetwork.custom-subnet-tf.ip_cidr_range
   sensitive = true
}

output "gcs-tf-bucket" {
    value = google_storage_bucket.gcs-bucket-cs.name
    sensitive = true
}
output "primary-cluster" {
    value = google_container_cluster.primary-cluster.name
    sensitive = true
}


