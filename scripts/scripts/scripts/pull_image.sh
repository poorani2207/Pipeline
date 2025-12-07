#!/bin/bash

AWS_REGION="ap-south-1"
ACCOUNT_ID="246844015696"
REPO_NAME="myapp"

echo "Logging in to Amazon ECR..."
aws ecr get-login-password --region $AWS_REGION | \
docker login --username AWS --password-stdin $ACCOUNT_ID.dkr.ecr.$AWS_REGION.amazonaws.com

# Read Image tag from CodeBuild imageDetail.json (if exists)
if [ -f /tmp/deploy/imageDetail.json ]; then
    IMAGE_TAG=$(jq -r '.imageUri' /tmp/deploy/imageDetail.json | awk -F':' '{print $2}')
else
    IMAGE_TAG="latest"
fi

echo "Pulling image from ECR: $REPO_NAME:$IMAGE_TAG"

docker pull $ACCOUNT_ID.dkr.ecr.$AWS_REGION.amazonaws.com/$REPO_NAME:$IMAGE_TAG
