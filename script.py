import os
from google.cloud import bigquery

# Set your environment variable for authentication on API call
os.environ["GOOGLE_APPLICATION_CREDENTIALS"]="/path/to/file.json"

# Construct a BigQuery client object.
client = bigquery.Client()

# table Id, in which we want to add data
table_id = "{}.traildataset.trailtable2".format(client.project)

job_config = bigquery.LoadJobConfig(
    schema = [
    bigquery.SchemaField("full_name", "STRING", mode="REQUIRED"),
    bigquery.SchemaField("age", "INTEGER", mode="REQUIRED"),
],
    skip_leading_rows=1,
    # This makes source format defaults to CSV
    source_format=bigquery.SourceFormat.CSV,
)

# adding csv data source 
uri = "gs://trail-gcs-to-bg-bucket/trailset1.csv"

# Making API request to load data from gcs
load_job = client.load_table_from_uri(
    uri, table_id, job_config=job_config
)  

load_job.result() 

# Making API request to get data from table to validate
destination_table = client.get_table(table_id)  
print("Loaded {} rows.".format(destination_table.num_rows))
