#!/bin/bash

# Provide default stack name
read -p $'🥞 Stack name: \033[90m(e.g. ProjectImageOptimiserStack)\033[0m ' stack

# Exit if user inputs nothing
if [[ $stack == "" ]]; then
    echo "🛑 Please provide a stack name."
    exit 0
fi

# Exit if stack name contains special characters
if [[ ! $stack =~ ^[a-zA-Z]+$ ]]; then
    echo "🛑 The stack name can only contain letters"
    exit 0
fi

# Provide default bucket name
read -p $'🪣 Bucket name: \033[90m(e.g. project-public-uploads)\033[0m ' bucket

# Exit if user inputs nothing
if [[ $bucket == "" ]]; then
    echo "🛑 Please provide a bucket name."
    exit 0
fi


# Exit if stack name contains special characters
if [[ ! $bucket =~ ^[a-z]+(-[a-z]+)*$ ]]; then
    echo "🛑 The bucket name must be lowercased and kebabed"
    exit 0
fi

# Confirmation of values
read -p $'🚦 Are the above values unique? \033[90m(Y/n)\033[0m ' confirmation
if [[ $confirmation == "n" ]]; then
    echo "🛑 Deployment aborted."
    exit 0
fi

# Confirmation to deploy
read -p $'👍 Ready to deploy? \033[90m(Y/n)\033[0m ' confirmation
if [[ $confirmation == "n" ]]; then
    echo "🛑 Deployment aborted."
    exit 0
else
    echo "🚀 Deploying..."
    BUCKET_NAME=$bucket STACK_NAME=$stack cdk deploy $stack -c S3_IMAGE_BUCKET_NAME="$bucket"
fi