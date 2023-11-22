#!/bin/sh

# INITIALIZATION ###############################

if [ ! -f "/build/.init" ] || [ "$(< "/build/.init")" != "1" ]
then

    sleep       1 && echo 1 > /build/.init

    rm          -f   "/etc/pam.d/vsftpd"
    echo        >>   "/etc/pam.d/vsftpd" "auth required pam_pwdfile.so pwdfile /etc/vsftpd/vsftpd.passwd"
    echo        >>   "/etc/pam.d/vsftpd" "account required pam_permit.so"

    mkdir       -p   "/etc/vsftpd"
    htpasswd    -bcp "/etc/vsftpd/vsftpd.passwd" "${FTP_USER_LOGIN}" "$(openssl passwd -1 -noverify ${FTP_USER_PASSWORD})"

fi

# BOOT #########################################

vsftpd