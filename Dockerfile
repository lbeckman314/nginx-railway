FROM nginx:alpine

RUN apk add --no-cache apache2-utils

ARG USER
ARG PASS
RUN htpasswd -bc /etc/nginx/.htpasswd $USER $PASS

# Copy to the special 'templates' directory
COPY nginx.conf.template /etc/nginx/templates/default.conf.template

EXPOSE 80

