// Configure the Google Cloud provider
provider "google" {
 credentials = "${file("<YOUR SERVICE ACCOUNT JSON KEY NAME>")}"
 project     = "<YOUR PROJECT ID>"
 region      = "<YOUR DEPLOYMENT REGION>"
}
