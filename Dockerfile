FROM httpd:latest
COPY index.html /var/www/html
COPY index.html /usr/local/apache2/htdocs
EXPOSE 80
