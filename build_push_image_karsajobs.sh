#!/bin/bash

# Membuat Docker Image ke Github Package untuk karsjobs
docker build -t ghcr.io/masbroustudio/karsajobs:latest .

# Log menggunakan GitHub Container Registry
docker login ghcr.io -u masbroustudio -p $GH_PACKAGES_TOKEN

# Mengunggah Docker image ke GitHub Container Registry
docker push ghcr.io/masbroustudio/karsajobs:latest
