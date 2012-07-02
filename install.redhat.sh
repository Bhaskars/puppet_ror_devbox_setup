#!/bin/bash

yum install rubygems
gem install puppet --no-rdoc --no-ri

puppet apply -v --modulepath puppet/modules config.pp  --debug
