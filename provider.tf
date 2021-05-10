// Configure the Google Cloud provider
provider "google" {
 credentials = file("upheld-apricot-313105-d87362db5f3e.json")
 project     = "upheld-apricot-313105"
 region      = "us-central1"
}