FROM composer as build
WORKDIR /app
COPY . /app
RUN composer update --no-interaction --no-scripts
RUN composer install --no-interaction --no-scripts

FROM php:8.1-apache
RUN docker-php-ext-install pdo_mysql
RUN a2enmod rewrite
RUN sed -i 's/Listen 80/Listen 8080/g' /etc/apache2/ports.conf
EXPOSE 8080
COPY --from=build /app /app
COPY vhost.conf /etc/apache2/sites-available/000-default.conf
RUN chown -R www-data:www-data /app
RUN chown -R www-data:www-data /app/storage
RUN chown -R www-data:www-data /app/bootstrap/cache

# Menambahkan langkah untuk membuat direktori /app/storage/logs
RUN mkdir -p /app/storage/logs
RUN chown -R www-data:www-data /app/storage/logs

# Menjalankan perintah php artisan key:generate dengan pengguna www-data
USER www-data
RUN php artisan key:generate

# Kembali ke pengguna root
USER root
