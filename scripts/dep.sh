#!/bin/bash

# Install deps
# apt-get
sudo apt-get update
# Install curl
sudo apt-get install -y curl
# Install git
sudo apt-get install -y git
# Install g++
sudo apt-get install -y g++-4.8
echo "export CXX=g++-4.8" >> /home/vagrant/.bashrc
echo "alias g++='g++-4.8'" >> /home/vagrant/.bash_aliases
echo "alias c++='c++-4.8'" >> /home/vagrant/.bash_aliases
# Install nvm
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.29.0/install.sh | bash
nvm install stable
nvm use stable
# Npm
npm install -g coffee-script
npm install -g node-gyp
npm install -g less
echo "source /home/vagrant/.nvm/nvm.sh" >> /home/vagrant/.bashrc
echo "nvm use stable" >> /home/vagrant/.bashrc
# Install rvm
sudo -i gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
curl -sSL https://rvm.io/mpapis.asc | gpg --import -
curl -sSL https://get.rvm.io | bash -s stable
# ruby
source /home/vagrant/.rvm/scripts/rvm
rvm install ruby-head --binary
# Append source
echo "source /home/vagrant/.rvm/scripts/rvm" >> /home/vagrant/.bashrc
echo "rvm use ruby-head" >> /home/vagrant/.bashrc
# gems
gem install bundle
gem install rails
gem install sass

# Python
# Pip
curl --silent https://bootstrap.pypa.io/get-pip.py | python -
# virtual env
pip install virtualenv
VENV=/home/vagrant/.virtualenv
mkdir /home/vagrant/.virtualenv
virtualenv /home/vagrant/.virtualenv
source /home/vagrant/.virtualenv/bin/activate
# Py packages

# java
sudo apt-get install -y openjdk-7-jre-headless
# mvn
sudo apt-get install maven
