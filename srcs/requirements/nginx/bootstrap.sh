#!/bin/sh

# INITIALIZATION ###############################

if [ ! -f "/build/.init" ] || [ "$(< "/build/.init")" != "1" ]
then

    sleep       1 && echo 1 > /build/.init

    openssl     req -newkey rsa:4096 -x509 -sha256 -days 365 -noenc             \
                    -subj   "/C=FR/L=Nice/O=42/OU=mconreau/CN=mconreau.42.fr"   \
                    -out    /etc/nginx/ssl/inception.crt                        \
                    -keyout /etc/nginx/ssl/inception.key                        \
                    > /dev/null

    usermod     -d /var/www/public www-data

fi

# BOOT #########################################

nginx -g "daemon off;"