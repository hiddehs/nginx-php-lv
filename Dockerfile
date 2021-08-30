FROM wyveo/nginx-php-fpm:php80
WORKDIR /app

# node
RUN wget -O /etc/apt/trusted.gpg.d/php.gpg https://packages.sury.org/php/apt.gpg
RUN apt-get update \
    && apt-get install -y curl \
    && apt-get install -y build-essential \
    && apt-get -y autoclean
RUN curl -fsSL https://deb.nodesource.com/setup_16.x | bash -
RUN apt-get install -y nodejs
RUN npm install -g npm
# confirm installation
RUN node -v
RUN npm -v

USER root
RUN echo 'decorate_workers_output = no\n[global]\nerror_log = /dev/stderr' >> /etc/php/8.0/fpm/pool.d/www.conf
COPY ./supervisord.conf /etc/supervisord.conf
ADD nginx/app.conf /etc/nginx/conf.d/default.conf

# laravel

COPY db_migrate.sh db_migrate.sh

RUN chmod +x db_migrate.sh
COPY .env.deploy .env

EXPOSE 80
