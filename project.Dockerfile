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

RUN composer dump-autoload --no-dev --optimize

USER root
