#!/bin/sh

# INITIALIZATION ###############################

if [ ! -f "/build/.init" ] || [ "$(< "/build/.init")" != "1" ]
then

    sleep       1 && echo 1 > /build/.init

    sed         -i "s|protected-mode yes|protected-mode no|g" /etc/redis/redis.conf

fi

# BOOT #########################################

redis-server --protected-mode no