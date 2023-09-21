# Deployment BWA MICRO

<http://bit.ly/micro-deploy>

1. Persiapan Akun & Server
Untuk mengikuti chapter deployment, usahakan kalian sudah mempunyai akun di penyedia server / vps. Berikut saya sertakan pilihannya.

Vultr.com (Recommended)
Digitalocean.com
Aws.amazon.com
Cloud.google.com

Pada chapter kali ini saya akan menggunakan vultr untuk deployment. Kalian bisa mendaftar di vultr dengan menggunakan link ini agar mendapatkan Free $100.

* Note: Semua server yang kita gunakan akan menggunakan Linux Ubuntu v18.04

2. Install Aplikasi
NVM (Node Version Manager)

* Install NVM

```sh
curl -o- <https://raw.githubusercontent.com/nvm-sh/nvm/v0.36.0/install.sh> | bash
```

* Jalankan

```sh
source ~/.bashrc
```

* Install nodejs & npm menggunakan nvm

```sh
nvm install v12.19.0
```

* Cek nodejs & npm version

```sh
node -v && npm -v
```

PM2 (Process Manager)

* Install pm2

```sh
npm install pm2 -g
```

* Cek instalasi dengan command

```sh
pm2
```

MySQL

* Install MySQL

```sh
sudo apt update
sudo apt install mysql-server
sudo mysql_secure_installation
```

* Buat user baru di MySql

```sh
mysql
CREATE USER 'nama_user'@'localhost' IDENTIFIED BY 'passwordmu';
GRANT ALL PRIVILEGES ON *.* TO 'nama_user'@'localhost' WITH GRANT OPTION;
Exit
```

Nginx

* Install nginx

```sh
sudo apt update
sudo apt install nginx
```

PHP

* Install php

```sh
sudo apt install software-properties-common
sudo add-apt-repository ppa:ondrej/php
sudo apt update
sudo apt install php7.4-fpm
sudo php-fpm7.4 -v
```

* Install dependencies yang dibutuhkan (copy semua sampai -y)

```sh
sudo apt install php7.4-common php7.4-mysql php7.4-xml php7.4-xmlrpc php7.4-curl php7.4-gd php7.4-imagick php7.4-cli php7.4-dev php7.4-imap php7.4-mbstring php7.4-opcache php7.4-soap php7.4-zip php7.4-intl php7.4-bcmath -y
```

## Composer

* Download composer

```sh
wget https://getcomposer.org/composer-stable.phar
```

* Install composer

```sh
chmod 755 composer-stable.phar
mv composer-stable.phar /usr/local/bin/composer
```

* Cek instalasi dengan command

```sh
composer
```

3. Kumpulan Script
Nginx Reverse Proxy

```sh
server {
  listen 80;
  listen [::]:80;

  location / {
      proxy_pass <http://localhost:3000/>;
  }
}
```

Run Node js dengan pm2

```sh
pm2 start --name=nama-service npm -- start
```

Memberi akses web server ke directory

```sh
sudo chown -R www-data.www-data /var/www/direktori-project/storage
sudo chown -R www-data.www-data /var/www/direktori-project/bootstrap/cache
```

Nginx configuration for laravel

```sh
server {
        listen 80;
        root /var/www/nama-directory;
        index index.php index.html index.htm;
        server_name domain_atau_ip;

        location / {
                try_files $uri $uri/ /index.php$is_args$args;
        }

        location ~ \.php$ {
                include snippets/fastcgi-php.conf;
                fastcgi_pass unix:/var/run/php/php7.4-fpm.sock;
        }

        location ~ /\.ht {
                deny all;
        }
}
```
