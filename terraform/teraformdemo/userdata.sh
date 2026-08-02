#!/bin/bash
# Update local packages
dnf update -y

# Install Apache Web Server
dnf install -y httpd

# Start and enable Apache service
systemctl start httpd
systemctl enable httpd

# Create a sample index webpage
echo "<h1>Hello World! Launched successfully via Terraform with UserData bootstrapping.</h1>" > /var/www/html/index.html