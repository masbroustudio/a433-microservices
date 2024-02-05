#!/bin/bash

# Memeriksa apakah Docker sudah terinstal pada sistem
if command -v docker &> /dev/null; then
    
    # Membangun image Docker dengan tag masbroustudio/order-service:latest
    docker build -t masbroustudio/order-service:latest .

    # Menampilkan daftar image Docker yang tersedia di lokal
    docker images

    # Menentukan nama paket Docker untuk GitHub Packages
    DOCKER_PACKAGE="ghcr.io/masbroustudio/order-service:latest"

    # Mengubah tag image Docker agar sesuai dengan format GitHub Packages
    docker tag masbroustudio/order-service:latest $DOCKER_PACKAGE

    # Melakukan login ke GitHub Packages menggunakan token akses pribadi (PAT)
    echo $GHCR_PAT | docker login ghcr.io -u masbroustudio --password-stdin

    # Mengunggah image Docker ke GitHub Packages
    docker image push $DOCKER_PACKAGE

else
    # Menampilkan pesan kesalahan jika Docker belum terinstal dan menghentikan skrip
    echo "Docker belum terinstal. Silakan instal Docker sebelum menjalankan skrip ini."
    exit 1
fi
