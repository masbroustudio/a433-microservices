#!/bin/bash

# Membangun image Docker
docker build -t ghcr.io/masbroustudio/shipping-service:latest .

# Masuk ke GitHub Container Registry
echo $GH_PACKAGES_TOKEN | docker login ghcr.io -u masbroustudio --password-stdin

# Mengunggah image Docker ke GitHub Container Registry
docker push ghcr.io/masbroustudio/shipping-service:latest
