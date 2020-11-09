#!/usr/bin/env bash
# This file tags and uploads an image to Docker Hub

# Assumes that an image is built via `run_docker.sh`
dockertag="housing-price-predictor"
username="weichiet"

# Step 1:
# Create dockerpath
dockerpath="$username/$dockertag"

# Step 2:
# Authenticate & tag
echo "Docker ID and Image: $dockerpath"
echo "Please provide password to login into Docker-Hub in order to upload $dockerpath"
docker login --username $username &&\
    docker image tag $dockertag $dockerpath

# Step 3:
# Push image to a docker repository
docker push $dockerpath
