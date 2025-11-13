#!/usr/bin/env bash

# Script to stop and remove the Metabase Docker container
# Ensure you have Docker installed and running on your machine

set -eou pipefail

# Check if Docker is installed and running
if ! command -v docker &> /dev/null
then
    echo "Docker could not be found. Please install Docker and try again."
    exit 1
fi
if ! docker info &> /dev/null
then
    echo "Docker is not running. Please start Docker and try again."
    exit 1
fi

# Stop and remove the Metabase container
docker stop metabase
docker rm metabase

# END