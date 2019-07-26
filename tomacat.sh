#!/bin/bash
mkdir /opt/tomcat
cd /opt/tomcat
yum install wget
wget http://mirrors.estointernet.in/apache/tomcat/tomcat-8/v8.5.43/bin/apache-tomcat-8.5.43.tar.gz

tar xvzf apache-tomcat-8.5.43.tar.gz
#Installing java8
sudo yum install openjdk-8-jdk -y
java -version

cat >> /etc/environment <<EOL
JAVA_HOME="/usr/lib/jvm/java-8-oracle"
JRE_HOME="/usr/lib/jvm/java-8-oracle/jdk"
EOL

cat >> /root/.bashrc <<EOL
JAVA_HOME=JRE_HOME="/usr/lib/jvm/java-8-oracle/jdk
export JAVA_HOME
EOL

#export JAVA_HOME=/usr
#export PATH=$PATH:$JAVA_HOME/bin
#java -version

cat >>  ~/.bashrc <<EOL
export CATALINA_HOME=/opt/tomcat/apache-tomcat-8.5.43
EOL

cd
source .bashrc
cd /opt/tomcat/apache-tomcat-8.5.43/bin

./startup.sh
