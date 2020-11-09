#!/usr/bin/env bash

# This tags and uploads an image to Docker Hub
dockertag="housing-price-predictor"
username="weichiet"

# Step 1:
# This is your Docker ID/path
dockerpath="$username/$dockertag"

# Step 2
# Run the Docker Hub container with kubernetes
kubectl run $dockertag\
    --image=$dockerpath\
    --port=80 --labels app=$dockertag

# Step 3:
# List kubernetes pods
kubectl get pods

# Step 4:
# Forward the container port to a host
kubectl port-forward pod/$dockertag 8000:80
