# Use the official Python image as a base image
FROM python:3.8-slim

# Set environment variables for Flask and MySQL
ENV FLASK_APP=app.py
ENV FLASK_RUN_HOST=0.0.0.0
ENV MYSQL_DATABASE_HOST=mysql
ENV MYSQL_DATABASE_USER=root
ENV MYSQL_DATABASE_PASSWORD=root
ENV MYSQL_DATABASE_DB=lms

# Install system dependencies
RUN apt-get update && apt-get install -y mariadb-client

# Update pip
RUN pip install --no-cache-dir --upgrade pip

# Set the working directory in the container
WORKDIR /app

# Copy the requirements file to the working directory
COPY requirements.txt .

# Copy the current directory contents into the container at /app
COPY . /app

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the MySQL dump file into the container
COPY mysql/lms.sql /docker-entrypoint-initdb.d/

# Expose port 5000 to the outside world
EXPOSE 5000

# Command to run the Flask application
CMD ["python", "-m", "flask", "run", "--host=0.0.0.0"]

