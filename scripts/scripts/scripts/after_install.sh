#!/bin/bash
set -e

echo "Running AfterInstall hook..."

# Navigate to app directory (change if your app is deployed somewhere else)
cd /home/ec2-user/app

# Install dependencies if needed (example for Node.js / Python — uncomment what you use)
# npm install
# pip install -r requirements.txt

echo "AfterInstall completed successfully."
