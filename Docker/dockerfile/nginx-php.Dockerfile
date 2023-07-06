FROM composer AS build
WORKDIR /app
COPY . /app
RUN composer update --no-interaction --no-scripts
RUN composer install --no-interaction --no-scripts

FROM php:8.1-fpm AS php
RUN docker-php-ext-install pdo_mysql
WORKDIR /var/www/html
COPY --from=build /app /var/www/html
RUN chown -R www-data:www-data /var/www/html/storage /var/www/html/bootstrap/cache
RUN apt-get update && apt-get install -y \
    nginx
COPY nginx.conf /etc/nginx/nginx.conf
EXPOSE 8080
CMD ["nginx", "-g", "daemon off;"]
