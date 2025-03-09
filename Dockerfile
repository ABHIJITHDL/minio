# Use Ubuntu as base image (supports apt)
FROM ubuntu:22.04

# Install dependencies (MinIO, NGINX, etc.)
RUN apt-get update && \
    apt-get install -y nginx curl && \
    curl -O https://dl.min.io/server/minio/release/linux-amd64/minio && \
    chmod +x minio && mv minio /usr/local/bin/

# Copy the NGINX config
COPY nginx.conf /etc/nginx/nginx.conf

# Expose only port 80 (Render allows only one port)
EXPOSE 80

# Start both NGINX and MinIO
CMD nginx && minio server /data --console-address :9001
