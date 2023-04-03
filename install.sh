#!/bin/bash

docker build -t ros2 .

cp head /usr/bin

cp head.service /etc/systemd/system
systemctl daemon-reload
systemctl enable head.service
systemctl start head.service
systemctl status head.service
