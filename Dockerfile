# Use the latest NGINX base image
FROM nginx:latest

# Maintainer information
LABEL maintainer="msoban584@gmail.com"

# Install required packages
RUN apt-get update && apt-get install -y \
    zip \
    unzip

# Set working directory
WORKDIR /usr/share/nginx/html

# Download website template and place it in the web server directory
ADD https://www.free-css.com/assets/files/free-css-templates/download/page254/photogenic.zip /usr/share/nginx/html/

# Unzip the downloaded template
RUN unzip photogenic.zip && \
    rm photogenic.zip

# Expose ports for HTTP and SSH
EXPOSE 80 443
#check webhook
