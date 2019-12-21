#!/usr/bin/bash

# allow running steamlink as root
sed -i  's|if \[ "\$(id -u)" == "0" ]; then|if false; then|' /usr/bin/steamlink

# start steamlink
exec /usr/bin/steamlink
