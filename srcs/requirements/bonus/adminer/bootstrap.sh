#!/bin/sh

# INITIALIZATION ###############################

if [ ! -f "/build/.init" ] || [ "$(< "/build/.init")" != "1" ]
then

    sleep       1 && echo 1 > /build/.init

    cd          /var/www/public
    curl        -L https://github.com/vrana/adminer/releases/download/v4.7.8/adminer-4.7.8.{php} -o index.#1
    chmod       +r index.php

    sed         -i "s|/run/php/php8.2-fpm.sock|${ADM_DOCKER_PORT}|g" /etc/php/8.2/fpm/pool.d/www.conf
    sed         -i "s|;clear_env|clear_env|g" /etc/php/8.2/fpm/pool.d/www.conf

fi

# BOOT #########################################

php-fpm8.2 -F