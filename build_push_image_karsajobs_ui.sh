#!/bin/bash

# Build Docker image of karsajobs-ui
docker build -t ghcr.io/masbroustudio/karsajobs-ui:latest .

# Log in to GitHub Container Registry Masbroustudio
docker login ghcr.io -u masbroustudio -p $GH_PACKAGES_TOKEN

# Push Docker image to GitHub Container Registry Masbroustudio
docker push ghcr.io/masbroustudio/karsajobs-ui:latest
