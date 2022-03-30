#!/bin/bash
sudo apt-get install apt-transport-https ca-certificates
sudo apt-get update
sudo apt-get install -y mongodb-org
sudo systemctl start mongod
sudo systemctl enable mongod
