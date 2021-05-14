resource "google_compute_instance" "default" {
  name         = "test"
  machine_type = "g1-small"
  zone         = "us-central1-a"

  tags = ["foo", "bar"]

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }
  network_interface {
    network = "default"

    access_config {
      // Ephemeral IP
    }
  }

  metadata = {
    foo = "bar"
  }

  metadata_startup_script = data.template_file.startup.rendered
  service_account {
    scopes = ["cloud-platform"]
  }

} 
