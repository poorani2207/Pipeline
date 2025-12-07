#!/bin/bash

CONTAINER_NAME="myapp"

echo "Checking for running container: $CONTAINER_NAME"

# Stop if running
if [ "$(docker ps -q -f name=$CONTAINER_NAME)" ]; then
  echo "Stopping running container..."
  docker stop $CONTAINER_NAME
fi

# Remove if exists
if [ "$(docker ps -aq -f name=$CONTAINER_NAME)" ]; then
  echo "Removing old container..."
  docker rm $CONTAINER_NAME
fi

echo "Container cleanup completed."
