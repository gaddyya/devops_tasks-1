#!/bin/bash

SCRIPT="../log_parser.sh"
SERVICE="log_parser.service"
TIMER="log_parser.timer"
INSTALL_PATH="/opt"
SERVICE_INSTALL_PATH="/etc/systemd/system"

mkdir -p $INSTALL_PATH
cp $SCRIPT $INSTALL_PATH
chmod +x $INSTALL_PATH/log_parser.sh

cp $SERVICE $SERVICE_INSTALL_PATH
cp $TIMER $SERVICE_INSTALL_PATH

systemctl enable log_parser.timer
systemctl start log_parser.timer