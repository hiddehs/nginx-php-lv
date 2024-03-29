[![Docker](https://github.com/hiddehs/nginx-php-lv/actions/workflows/docker-publish.yml/badge.svg)](https://github.com/hiddehs/nginx-php-lv/actions/workflows/docker-publish.yml)


```bash
docker pull hiddehs/nginx-php-lv:latest
```

## Intro
This is a Dockerfile extending [wyveo/nginx-php-fpm](https://github.com/wyveo/nginx-php-fpm) for specific production Laravel usage.

## Specs
- [x] LV logging to stdout
- [x] php-fpm 8.1
- [x] php-fpm pool conf (20 child, static, max rq 1000) K8S QoS from [Scaling PHP FPM based on util demand](https://blog.wyrihaximus.net/2021/01/scaling-php-fpm-based-on-utilization-demand-on-kubernetes/) 
- [x] GitLab auto-deploy-ready ✅ + migrate db -> [db_migrate.sh](db_migrate.sh)
- [x] node.js 16.x

### [Example project-specific-Dockerfile](project.Dockerfile)
`.env.composer` to be available in root dir