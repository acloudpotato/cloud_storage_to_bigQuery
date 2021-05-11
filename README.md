# cloud_storage_to_bigQuery

This repo will help you to deploy your a google compute engine VM Instance to Google cloud platform using terraform, Also I used one python script for transfering csv data to my cloud storage bucket to a bigquery dataset table.

This repo contains several terraform configuration files & a python script file.

## [main.tf](https://github.com/abhishek7389/cloud_storage_to_bigQuery/main.tf) 
This terraform file is used to configure google compute engine vm instance, their machine type, image, network configuration, start up script, metadata etc. you can change it according to your requirement.

## [provider.tf](https://github.com/abhishek7389/cloud_storage_to_bigQuery/provider.tf)
Basically, this is a file which defines provider and terraform version you used to deploy your infrastructure. I suggest go with latest one but here in this repo I used older one which is terraform 0.12. If you're using cloud shell than this version is already installed in your machine.

## [script.py](https://github.com/abhishek7389/cloud_storage_to_bigQuery/script.py)
This script file is used to transfer csv data from existing google cloud storage to bigquery dataset table. I used some google storage & bigquery client library in this file.


## Requirements

- a GCP account
- python 3.6 or greater (Latest one is recommanded)
- a configured gcloud SDK
- [storage client](https://googleapis.dev/python/bigquerystorage/latest/index.html) library for python
- [bigquery client](https://pypi.org/project/google-cloud-bigquery/) library for python
- terraform


## Set up

1. create a service account with proper permissions like here our script is working with cloud storage & bigquery so give permission   accordingly & generate a json api key to use it in futher step.

2. clone the repo into your machine 

- $git clone https://github.com/abhishek7389/cloud_storage_to_bigQuery

3. Change the directory where all files are located

- $cd cloud_storage_to_bigQuery

4. see the all configuration files & if required change it accordingly.

Note: Change environment variable GOOGLE CLOUD CREDENTIAL path with your downloaded json key path.

5. Now, initiaze the terraform in this folder & check all things are working well, Also review deployments.

- $terraform init

- $terraform plan

6. If you don't get any error then let's deploy our configuration

- $terraform apply

7. now ssh to your vm instance

- $gcloud compute ssh --project=PROJECT_ID --zone=ZONE VM_NAME

8. try to run script.py using python3

- $python3 script.py

you'll see output as some insertions are taken place, got to your bigquery table and verify your cloud storage data has been added.

9. After experimenting with this demo, let's clean up & destroy what we deployed

- $terraform destroy
