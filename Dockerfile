# Use the official Ubuntu image as a base
FROM ubuntu:20.04

# Set environment variables to avoid interactive prompts during installation
ENV DEBIAN_FRONTEND=noninteractive

# Install Apache2 and other necessary packages
RUN apt-get update && \
    apt-get install -y apache2 curl zip && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Create a directory for the website files
RUN mkdir -p /var/www/html

# Copy the HTML file into the web server's root directory
COPY index.html /var/www/html/index.html

# Create a sample ZIP file (this can be an actual ZIP file you want to serve)
RUN echo "This is a test ZIP file." > /var/www/html/sample.txt && \
    zip -j /var/www/html/sample.zip /var/www/html/sample.txt && \
    rm /var/www/html/sample.txt

# Expose port 80
EXPOSE 80

# Start Apache in the foreground
CMD ["apachectl", "-D", "FOREGROUND"]

