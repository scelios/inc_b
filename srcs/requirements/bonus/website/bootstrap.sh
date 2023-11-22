#!/bin/sh

# INITIALIZATION ###############################

if [ ! -f "/build/.init" ] || [ "$(< "/build/.init")" != "1" ]
then

    sleep       1 && echo 1 > /build/.init

    python3    -m markdown /var/www/public/index.md -f /var/www/public/index.html
fi

# BOOT #########################################

python3 -m http.server --cgi -d /var/www/public 8080