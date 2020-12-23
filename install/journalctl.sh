#!/bin/sh
# journalctl -F _SYSTEMD_UNIT -> zeigt alle mögliche Systemd units an
journalctl -u corsAnywhere -f #gibt das logging aus -f -> letzte Einträge
