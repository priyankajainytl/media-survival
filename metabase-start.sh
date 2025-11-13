#!/usr/bin/env bash

# Script to start Metabase in a Docker container
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

# Create a directory for Metabase data if it doesn't exist

mkdir -p ~/metabase-data
docker run -d -p 3000:3000 \
    -v ~/metabase-data:/metabase-data \
    -e "MB_DB_FILE=/metabase-data/metabase.db" \
    -e "MB_DB_TYPE=postgres" \
    -e "MB_DB_DBNAME=media_survival" \
    -e "MB_DB_PORT=5433" \
    -e "MB_DB_USER=postgres" \
    -e "MB_DB_PASS=test" \
    -e "MB_DB_HOST=host.docker.internal" \
    --name metabase \
    metabase/metabase

# END