#!/bin/sh
cp ./corsAnywhere.service /etc/systemd/system/
systemctl start corsAnywhere
systemctl enable corsAnywhere
systemctl status corsAnywhere