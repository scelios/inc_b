#!/bin/sh

# INITIALIZATION ###############################

if [ ! -f "/build/.init" ] || [ "$(< "/build/.init")" != "1" ]
then

    sleep       1 && echo 1 > /build/.init

    curl        -L https://raw.githubusercontent.com/filebrowser/get/master/get.sh | bash

    filebrowser config init
    filebrowser config set -a "0.0.0.0" -b "/${FBW_DOCKER_HOST}" -p ${FBW_DOCKER_PORT}
    filebrowser users add ${FBW_ADMIN_LOGIN} ${FBW_ADMIN_PASSWORD}

fi

# BOOT #########################################

filebrowser -r /var/www/public