# Bookworm

[![codecov](https://codecov.io/gh/hansjhoffman/bookworm-api/branch/master/graph/badge.svg?token=5KvLCxDAN5)](https://codecov.io/gh/hansjhoffman/bookworm-api)

REST and GraphQL API for Bookworm apps

## DO Setup
```
mkdir /opt/bookworm
cp -R /home/bookworm/_build/prod/rel/bookworm/* /opt/bookworm
chown -R bookworm:root /opt/bookworm
ln -s /opt/bookworm/bin/bookworm /usr/local/bin/bookworm
bookworm eval "Bookworm.ReleaseTasks.migrate"
bookworm eval "Bookworm.ReleaseTasks.seed"
service bookworm start
```

## Create systemd service
```
vim /etc/systemd/system/bookworm.service

[Unit]
Description=Bookworm API
After=network.target

[Service]
Type=forking
User=bookworm
Group=bookworm
WorkingDirectory=/opt/bookworm
ExecStart=/opt/bookworm/bin/bookworm start
ExecStop=/opt/bookworm/bin/bookworm stop
PIDFile=/opt/bookworm/bookworm.pid
Restart=on-failure
RestartSec=5
Environment=PORT=4000
Environment=LANG=en_US.UTF-8
Environment=PIDFILE=/opt/bookworm/bookworm.pid
SyslogIdentifier=bookworm
RemainAfterExit=no

[Install]
WantedBy=multi-user.target
```
