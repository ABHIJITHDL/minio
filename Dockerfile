# Use MinIO official image as base
FROM minio/minio:latest

# Install NGINX using apk (Alpine package manager)
RUN apk add --no-cache nginx

# Copy the NGINX config
COPY nginx.conf /etc/nginx/nginx.conf

# Expose only port 80 (Render allows only one port)
EXPOSE 80

# Start both NGINX and MinIO
CMD nginx && minio server /data --console-address :9001
