#!/bin/bash
# Configures Vagrant box

# Install nodejs
source /home/vagrant/.nvm/nvm.sh
nvm install stable
echo "source /home/vagrant/.nvm/nvm.sh" >> /home/vagrant/.bashrc
echo "nvm use stable" >> /home/vagrant/.bashrc
# RVM
rvm install ruby-head --binary
echo "rvm use ruby-head" >> /home/vagrant/.bashrc
