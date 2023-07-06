# API Service Course for Buildwith Fajar

- reference

<https://learnk8s.io/blog/kubernetes-deploy-laravel-the-easy-way>

- copy .env.example to .env

- build image laravel

```sh
docker build -t fajjarnr/bwf-service-user .
```

- build image nginx

```sh
docker build -f ./Docker/dockerfile/nginx.Dockerfile -t fajjarnr/nginx-service-user .
```

- or run with docker-compose

```sh
docker-compose up -d
```

- run migrate

```sh
docker exec -it bwf-service-course bash
php artisan migrate
exit
```
