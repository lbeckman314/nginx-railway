FROM nginx:alpine

# Install utility to generate the password file
RUN apk add --no-cache apache2-utils

# Set these via Railway Environment Variables
ARG PROXY_USERNAME
ARG PROXY_PASSWORD

# Create the .htpasswd file
RUN htpasswd -bc /etc/nginx/.htpasswd $PROXY_USERNAME $PROXY_PASSWORD

COPY nginx.conf /etc/nginx/nginx.conf

EXPOSE 80
