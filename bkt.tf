resource "google_storage_bucket" "my-bucket" {
  name          = "big-gcs"
  project       = "leafy-summer-405104"
  location      = "US"
  force_destroy = true
}
