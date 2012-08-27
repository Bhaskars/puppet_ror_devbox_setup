#!/bin/bash

sudo apt-get install rubygems -y
gem install puppet --no-rdoc --no-ri

puppet resource package git ensure=present

git submodule init
git submodule update

sudo add-apt-repository ppa:webupd8team/java -y
sudo apt-get install oracle-java7-installer

puppet apply -v --modulepath puppet/modules config.pp --debug

sudo apt-get install oracle-java7-installer

source /etc/profile

sudo apt-get remove rubygems -y

sudo apt-get autoremove -y