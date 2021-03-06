FROM php:7.0-fpm

RUN apt-get update && \
    apt-get install -y \
	libz-dev \
        libpq-dev \
        libjpeg-dev \
        libpng12-dev \
        libfreetype6-dev \
        libssl-dev \
        libmcrypt-dev \
        librabbitmq-dev \
	libcurl3-dev \
        libgmp-dev

RUN docker-php-ext-install mysqli \ 
    && docker-php-ext-configure gmp \ 
    && docker-php-ext-install gmp \	
    && docker-php-ext-install pdo_mysql \
    && docker-php-ext-install gd \
    && docker-php-ext-install mcrypt \
    && docker-php-ext-install gd \
    && docker-php-ext-install opcache \
    && docker-php-ext-install bcmath \
    && docker-php-ext-install zip 

#redis
RUN pecl install -o -f redis \
    &&  docker-php-ext-enable redis

#swoole
RUN pecl install swoole \
    &&  docker-php-ext-enable swoole

#mongodb
RUN pecl install mongodb && \
    docker-php-ext-enable mongodb

#amqp
RUN pecl install amqp && \
    docker-php-ext-enable amqp

#yar
RUN pecl install msgpack && \
    docker-php-ext-enable msgpack && \
    pecl install yar && \
    docker-php-ext-enable yar

#apcu
RUN pecl install apcu && \
    docker-php-ext-enable apcu

ADD ./xphp.ini /usr/local/etc/php/conf.d/
ADD ./xwww.conf /usr/local/etc/php-fpm.d/

RUN usermod -u 1000 www-data

EXPOSE 9000

CMD ["php-fpm"]
