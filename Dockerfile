FROM php:7.0-fpm

RUN apt-get update && \
    apt-get install -y \
	libz-dev \
        libpq-dev \
        libjpeg-dev \
        libpng12-dev \
        libfreetype6-dev \
        libssl-dev \
        libmcrypt-dev


#RUN docker-php-ext-install mcrypt

#RUN docker-php-ext-install mysqli \
#    && docker-php-ext-install pdo_mysql

#RUN docker-php-ext-install gd
