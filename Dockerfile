# Use MinIO official image as base
FROM minio/minio:latest

# Install NGINX
RUN apt-get update && apt-get install -y nginx

# Copy the NGINX config
COPY nginx.conf /etc/nginx/sites-enabled/default

# Expose only port 80 (since Render allows only one port)
EXPOSE 80

# Start both NGINX and MinIO
CMD service nginx start && minio server /data --console-address :9001
