#!/bin/bash
CONTAINER_NAME="myapp"

echo "Validating deployment..."
docker ps | grep $CONTAINER_NAME && echo "Validation successful" && exit 0

echo "Validation failed"
exit 1
