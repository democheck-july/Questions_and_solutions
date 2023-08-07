# Questions_and_solutions


Q1) 3 tier Architecture on K8s platform  
![3tier_architecture](https://github.com/democheck-july/Questions_and_solutions/assets/110294319/3274e0c0-a7c5-4382-8ca3-dfb759e01427)



Q2) write code that will query the meta data of an instance within AWS or Azure or GCP and provide a json formatted output.

#!/bin/bash

# Retrieve instance metadata
instance_id=$(curl -s http://169.254.169.254/latest/meta-data/instance-id)
instance_type=$(curl -s http://169.254.169.254/latest/meta-data/instance-type)
availability_zone=$(curl -s http://169.254.169.254/latest/meta-data/placement/availability-zone)


# Output metadata as JSON
echo "{
    \"instance_id\": \"$instance_id\",
    \"instance_type\": \"$instance_type\",
    \"availability_zone\": \"$availability_zone\"
}"


Q3)
