# Use MinIO official image
FROM minio/minio:latest

# Expose MinIO ports
EXPOSE 9000 9001

# Set default environment variables
ENV MINIO_ROOT_USER=my_minio_user
ENV MINIO_ROOT_PASSWORD=my_minio_password

# Start MinIO server when the container runs
CMD ["server", "/data", "--console-address", ":9001"]
