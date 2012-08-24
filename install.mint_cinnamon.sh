#!/bin/bash

#apt-get install rubygems
gem install puppet --no-rdoc --no-ri

add-apt-repository ppa:webupd8team/java
apt-get install oracle-java7-installer

puppet apply -v --modulepath puppet/modules config.pp --debug

apt-get install oracle-java7-installer

source /etc/profile
gem uninstall puppet