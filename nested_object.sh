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
