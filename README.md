[![Docker](https://github.com/hiddehs/nginx-php-lv/actions/workflows/docker-publish.yml/badge.svg)](https://github.com/hiddehs/nginx-php-lv/actions/workflows/docker-publish.yml)
## Intro
This is a Dockerfile extending [wyveo/nginx-php-fpm](https://github.com/wyveo/nginx-php-fpm) for specific production Laravel usage.

## Specs
- [x] LV logging to stdout
- [x] php-fpm 8.0
- [x] GitLab auto-deploy-ready ✅ + migrate db -> [db_migrate.sh](db_migrate.sh)
- [x] node.js 16.x