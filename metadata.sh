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