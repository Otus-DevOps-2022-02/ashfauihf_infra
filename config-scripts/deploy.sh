#!/bin/bash
sudo apt-get update
sudo apt install git
git clone -b monolith https://github.com/express42/reddit.git
cd reddit && sudo bundle install
puma -d
