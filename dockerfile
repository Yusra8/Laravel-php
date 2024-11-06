From php:8.2-apache
COPY  site/ /var/www/html
WORKDIR var/www/html/
RUN echo "ServerName localhost">> /etc/apache2/appache2.conf
RUN  docker-php-ext-install pdo pdo_mysql
EXPOSE 80

