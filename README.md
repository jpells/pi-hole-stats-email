# pi-hole-stats-email

pi-hole-stats-email is a bash script which emails rolling 24 hour average stats for pi-hole.

## Features

* Fetches pi-hole stats using their [Telnet API](https://docs.pi-hole.net/ftldns/telnet-api/).
* Sends the stats via email using your smtp server and `curl`. (Note: Only smtps via SSL/TLS is supported at this time.)

## Prerequisites

* **pi-hole:** Installed and running on your system.
* **curl:** Installed for sending email.
* **cron (optional):** For scheduling daily reports.

## Install

This snippet will download the shell script and make it executable.

```bash
curl -O https://raw.githubusercontent.com/jpells/pi-hole-stats-email/main/pi-hole-stats-email
chmod +x pi-hole-stats-email
```

## Usage

```
Usage:
  pi-hole-stats-email SMTP_HOST SMTP_CREDENTIALS FROM_EMAIL TO_EMAIL
  pi-hole-stats-email --help | -h
  pi-hole-stats-email --version | -v

Options:
  --help, -h
    Show this help

  --version, -v
    Show version number

Arguments:
  SMTP_HOST
    SMTP Host and Port (e.g. smtp.mailserver.com:465)

  SMTP_CREDENTIALS
    SMTP Credentials for Login (e.g. username:password)

  FROM_EMAIL
    Email address to send as (e.g. from@mailserver.com)

  TO_EMAIL
    Email address for delivery (e.g. to@mailserver.com)

Examples:
  pi-hole-stats-email smtp.mailserver.com:465 username:password from@mailserver.com to@mailserver.com
```

## Acknowledgements

This tool was built using [Bashly](https://bashly.dannyb.co/)

## Disclaimer

Use this script at your own risk. The author is not responsible for any data loss or other issues that may arise.
