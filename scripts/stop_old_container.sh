#!/bin/bash
CONTAINER_NAME="myapp"

echo "Stopping old container if exists..."
docker ps -q --filter "name=$CONTAINER_NAME" | grep -q . && docker stop $CONTAINER_NAME
docker ps -a -q --filter "name=$CONTAINER_NAME" | grep -q . && docker rm $CONTAINER_NAME

echo "Old container removed."
