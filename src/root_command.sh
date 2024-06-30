#!/usr/bin/env bash

# Setup arguments
smtp_host=smtps://${args[smtp_host]}
smtp_credentials=${args[smtp_credentials]}
from_email=${args[from_email]}
to_email=${args[to_email]}

# Get stats from pi-hole
pi_hole_host=127.0.0.1
pi_hole_port=4711
command='>stats'
stats=$(echo $command | nc $pi_hole_host $pi_hole_port -w 1)

# Create email
printf -v date '%(%Y-%m-%d)T\n' -1 # current date
email=$(cat <<EOM
From: ${from_email}
To: ${to_email}
Subject: pi-hole stats ${date}


${stats}
EOM
)

# Send email
curl --silent --url $smtp_host --ssl-reqd \
    --mail-from $from_email --mail-rcpt $to_email \
    --user $smtp_credentials \
    --upload-file <(echo "$email")