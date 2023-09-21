# API Service Course for Buildwith Fajar

- reference

<https://learnk8s.io/blog/kubernetes-deploy-laravel-the-easy-way>

# Docker

- build image laravel

```sh
docker build -t fajjarnr/bwf-service-course .

docker push fajjarnr/bwf-service-course
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

# Openshift

```sh
mysql -u root -p

create database service_course
```

```sh
php artisan migrate
```

```sh
oc create route edge --service=bwf-service-course bwf-service-course --hostname bwf-service-course.apps.fajar-project.site
```
