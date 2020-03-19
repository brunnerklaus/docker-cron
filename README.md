# docker-cron
========

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

Run shell scripts as Cronjobs in single Docker container. You can define multiple shell scripts & crontabs. This supports both `sh` & `bash` shell.

### Add cron scripts

- Put all your shell scripts in `scripts` folder.

```bash
#!/bin/bash

Date=$(date)
echo "This is a bash script, ran on $Date"
```

### Define crontab for your scripts (install_crontab.txt)

- Use the `install_crontab.txt.example` to create the correct `install_crontab.txt` file before you start.
- Define the crontabs for your scripts in `install_crontab.txt` file

```bash
*/30 * * * * /scripts//sh-script.sh >> /var/log/cron.log
*/5 * * * * /scripts/bash-script.sh >> /var/log/cron.log
```

### Using docker-compose
```bash
$ docker-compose build
$ docker-compose up -d
```

### Logs
Whatever script you write logs to `/var/log/cron.log` will get redirected to your container logs
```bash
$ docker-compose logs -f
```
