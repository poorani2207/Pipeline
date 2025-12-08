#!/bin/bash
CONTAINER_NAME="myapp"

echo "Validating deployment..."
if docker ps --format '{{.Names}}' | grep -w "$CONTAINER_NAME"; then
    echo "Validation successful"
    exit 0
else
    echo "Validation failed"
    exit 1
fi
