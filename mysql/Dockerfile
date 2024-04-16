# Use the official MySQL image as a base
FROM mysql:5.7

# Set the environment variables
ENV MYSQL_ROOT_PASSWORD=root
ENV MYSQL_DATABASE=lms

# Copy the SQL dump file into the container
COPY lms.sql /docker-entrypoint-initdb.d/

# Expose port 3306 to allow external connections
EXPOSE 3306

