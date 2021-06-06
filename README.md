[![Docker](https://github.com/hiddehs/nginx-php-lv/actions/workflows/docker-publish.yml/badge.svg)](https://github.com/hiddehs/nginx-php-lv/actions/workflows/docker-publish.yml)


```bash
docker pull hiddehs/nginx-php-lv:latest
```

## Intro
This is a Dockerfile extending [wyveo/nginx-php-fpm](https://github.com/wyveo/nginx-php-fpm) for specific production Laravel usage.

## Specs
- [x] LV logging to stdout
- [x] php-fpm 8.0
- [x] GitLab auto-deploy-ready ✅ + migrate db -> [db_migrate.sh](db_migrate.sh)
- [x] node.js 16.x

## Example project-specific-Dockerfile
`.env.composer` to be available in root dir

```Docker
FROM hiddehs/nginx-php-lv:latest

# COMPOSER INSTALL
COPY composer.lock composer.json /app/
COPY .env.composer /app/.env
RUN composer install --prefer-dist --no-scripts --no-dev --no-autoloader

# NPM BUILD PRODUCTION

COPY *.json /app/
RUN npm install --include=dev

COPY public /app/public/
COPY resources /app/resources

COPY *.yml *.js *.vue /app/
COPY resources/js/ /app/resources/js/

RUN npm run production

# COPY app
RUN chown -R nginx:nginx vendor

USER nginx
ADD --chown=nginx:nginx . /app

RUN chmod +x db_migrate.sh

RUN composer dump-autoload --no-dev --optimize

USER root

```
