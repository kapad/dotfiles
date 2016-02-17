#!/bin/bash
echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | sudo /usr/bin/debconf-set-selections > /dev/null 2>&1
sudo add-apt-repository ppa:webupd8team/java -y > /dev/null 2>&1
sudo apt-get update > /dev/null 2>&1
sudo apt-get install git oracle-java8-installer oracle-java8-set-default -y > /dev/null 2>&1
export JAVA_HOME='/usr/lib/jvm/java-8-oracle'
