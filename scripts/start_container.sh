#!/bin/bash

CONTAINER_NAME="myapp"
PORT=8080
AWS_REGION="ap-south-1"
ACCOUNT_ID="311719320436"
REPO_NAME="myapp"

# Read Image tag from CodeBuild imageDetail.json
if [ -f /tmp/deploy/imageDetail.json ]; then
    IMAGE_TAG=$(jq -r '.imageUri' /tmp/deploy/imageDetail.json | awk -F':' '{print $2}')
else
    IMAGE_TAG="latest"
fi

echo "Using IMAGE TAG: $IMAGE_TAG"

echo "Stopping old container if exists"
docker stop $CONTAINER_NAME || true
docker rm $CONTAINER_NAME || true

# 🔥 Kill container using port if exists
CONTAINER_ON_PORT=$(docker ps -q --filter "publish=$PORT")
if [ ! -z "$CONTAINER_ON_PORT" ]; then
    echo "Port $PORT is in use. Stopping container $CONTAINER_ON_PORT..."
    docker stop $CONTAINER_ON_PORT || true
    docker rm $CONTAINER_ON_PORT || true
fi

echo "Starting new container..."
docker run -d --name $CONTAINER_NAME -p $PORT:80 $ACCOUNT_ID.dkr.ecr.$AWS_REGION.amazonaws.com/$REPO_NAME:$IMAGE_TAG
