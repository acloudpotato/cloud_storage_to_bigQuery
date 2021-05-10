resource "google_compute_instance" "default" {
 name         = "trail-vm"
 machine_type = "f1-micro"
 zone         = "us-central1-a"

 boot_disk {
   initialize_params {
     image = "debian-cloud/debian-9"
   }
 }

// Make sure flask is installed on all new instances for later steps
 metadata_startup_script = "sudo apt-get update; sudo apt-get install -yq build-essential python-pip rsync; sudo apt-get install git; git clone https://github.com/abhishek7389/cloud_storage_to_bigQuery; cd cloud_storage_to_bigQuery; python3 script.py"

 network_interface {
   network = "default"

   access_config {
     // Include this section to give the VM an external ip address
   }
 }
}