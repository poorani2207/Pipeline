#!/bin/bash
AWS_REGION="ap-south-1"
ACCOUNT_ID="<246844015696>"
REPO_NAME="myapp-repo"
IMAGE_TAG="latest"

echo "Logging in to Amazon ECR..."
aws ecr get-login-password --region $AWS_REGION | docker login --username AWS --password-stdin $ACCOUNT_ID.dkr.ecr.$AWS_REGION.amazonaws.com

echo "Pulling latest image..."
docker pull $ACCOUNT_ID.dkr.ecr.$AWS_REGION.amazonaws.com/$REPO_NAME:$IMAGE_TAG
