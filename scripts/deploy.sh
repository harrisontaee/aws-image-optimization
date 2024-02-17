#!/bin/bash

# Initialize variables
BUCKET_NAME=""
STACK_NAME=""

# Parse command line arguments
while [[ "$#" -gt 0 ]]; do
    case $1 in
        --bucket) BUCKET_NAME="$2"; shift ;;
        --stack) STACK_NAME="$2"; shift ;;
        *) echo "🧐 Unknown parameter passed: $1"; exit 1 ;;
    esac
    shift
done

# Check if both arguments were provided
if [ -z "$BUCKET_NAME" ] || [ -z "$STACK_NAME" ]; then
    echo "😬 Both bucket name and stack name are required."
    exit 1
fi

# Show the parameters
echo "🪣  Bucket: $BUCKET_NAME"
echo "🥞 Stack: $STACK_NAME"

# Ask for user confirmation
read -p "👍 Should we deploy? [90m(Y/n)[0m " confirmation

if [[ $confirmation == "n" ]]; then
    echo "🛑 Deployment aborted."
    exit 0
else
    echo "🚀 Deploying..."
    BUCKET_NAME=$BUCKET_NAME STACK_NAME=$STACK_NAME cdk deploy $STACK_NAME -c S3_IMAGE_BUCKET_NAME="$BUCKET_NAME"
fi
