#!/bin/sh

# Create the /etc/ssmtp/ssmtp.conf file for sending reports, using
# values specified in the environment.
cat << EOM > /etc/ssmtp/ssmtp.conf
root=$SSMTP_SENDER_ADDRESS
mailhub=$SSMTP_HOST
AuthUser=$SMTP_USER
AuthPass=$SMTP_PASS
UseTLS=YES
UseSTARTTLS=YES
EOM
