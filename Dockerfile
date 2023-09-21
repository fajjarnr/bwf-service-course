FROM composer as build

WORKDIR /app

COPY . /app

RUN composer update --no-interaction --no-scripts
RUN composer install --no-interaction --no-scripts

# 

FROM php:8.1-apache

ENV APP_ENV=production
ENV APP_DEBUG=false

RUN docker-php-ext-install pdo_mysql

RUN a2enmod rewrite

COPY --from=build /app /var/www/html

COPY vhost.conf /etc/apache2/sites-available/000-default.conf

RUN chmod 777 -R /var/www/html/storage/ && \
    chown -R www-data:www-data /var/www/

EXPOSE 8080

USER www-data