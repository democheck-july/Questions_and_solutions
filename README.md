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


Q3)function where you pass in the object and a key and get back the value from a nested object
# Define the function (you can place it in a shell script)
get_nested_value() {
    local object="$1"
    local key="$2"

    # Convert the key into an array of keys
    IFS="/" read -ra key_parts <<< "$key"
    
    local value="$object"
    
    # Traverse through the keys
    for part in "${key_parts[@]}"; do
        value=$(echo "$value" | sed -E -n "s/^.*\"$part\": ?\"?([^\"]+)\"?.*$/\1/p")
    done
    
    echo "$value"
}

# Example usages
object1='{"a":{"b":{"c":"d"}}}'
key1="a/b/c"
result1=$(get_nested_value "$object1" "$key1")
echo "Value 1: $result1"

object2='{"x":{"y":{"z":"a"}}}'
key2="x/y/z"
result2=$(get_nested_value "$object2" "$key2")
echo "Value 2: $result2"

