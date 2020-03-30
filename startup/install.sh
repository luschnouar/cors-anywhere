#!/bin/sh
cp ./nodeJs_cors-anywhere.sh /etc/init.d
chown root:root /etc/init.d/nodeJs_cors-anywhere.sh 
chmod +x /etc/init.d/nodeJs_cors-anywhere.sh
sudo update-rc.d nodeJs_cors-anywhere.sh defaults
/etc/init.d/nodeJs_cors-anywhere.sh start