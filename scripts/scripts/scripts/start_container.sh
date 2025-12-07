#!/bin/bash
CONTAINER_NAME="myapp"
PORT=80
AWS_REGION="ap-south-1"
ACCOUNT_ID="<246844015696>"
REPO_NAME="myapp-repo"
IMAGE_TAG="latest"

echo "Starting new container..."
docker run -d --name $CONTAINER_NAME -p $PORT:80 $ACCOUNT_ID.dkr.ecr.$AWS_REGION.amazonaws.com/$REPO_NAME:$IMAGE_TAG
