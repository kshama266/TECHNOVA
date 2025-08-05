#!/bin/bash
sudo apt update -y
sudo apt install -y docker.io
sudo systemctl start docker
sudo systemctl enable docker

# Pull and run Docker image
docker pull reshav/technovaa-node:latest
docker run -d -p 3000:3000 reshav/technovaa-node:latest
