# Use the latest CentOS base image
FROM centos:latest

# Maintainer information
LABEL maintainer="msoban584@gmail.com"

# Install required packages
RUN yum install -y httpd \
    zip \
    unzip

# Download website template and place it in the web server directory
ADD https://www.free-css.com/assets/files/free-css-templates/download/page254/photogenic.zip /var/www/html/

# Set working directory
WORKDIR /var/www/html/



# Unzip the downloaded template
RUN unzip photogenic.zip

# Copy contents to the current directory
RUN cp -rvf photogenic/* .

# Clean up unnecessary files
RUN rm -rf photogenic photogenic.zip

# Start Apache HTTP Server in the foreground
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]

# Expose ports for HTTP and SSH
EXPOSE 80 443 22