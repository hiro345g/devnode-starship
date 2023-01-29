#!/bin/sh

STARSHIP_CMD=starship
STARSHIP_CMD_FILE=/home/node/Download/${STARSHIP_CMD}

if [ ! -e ${STARSHIP_CMD_FILE} ]; then
  cd /home/node/Download
  wget https://github.com/starship/starship/releases/latest/download/starship-x86_64-unknown-linux-musl.tar.gz
  tar xf starship-x86_64-unknown-linux-musl.tar.gz
  if [ "x$(id -u)" = "x0" ]; then
    chown node:node starship-x86_64-unknown-linux-musl.tar.gz ${STARSHIP_CMD}
  fi
fi
