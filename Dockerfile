FROM scratch
MAINTAINER Olumide Ajiboye <olumideajiboye@yahoo.com>

ADD centos-7-kinihun.tar.xz /
RUN yum update -y && yum upgrade -y
RUN yum install -y wget vim curl

ENV JAVA_VERSION 8u121
ENV BUILD_VERSION b13
# Downloading Java
RUN wget --no-cookies --no-check-certificate --header "Cookie: oraclelicense=accept-securebackup-cookie" "http://download.oracle.com/otn-pub/java/jdk/$JAVA_VERSION-$BUILD_VERSION/jdk-$JAVA_VERSION-linux-x64.rpm" -O /tmp/jdk-8-linux-x64.rpm

RUN yum -y install /tmp/jdk-8-linux-x64.rpm

RUN alternatives --install /usr/bin/java jar /usr/java/latest/bin/java 200000
RUN alternatives --install /usr/bin/javaws javaws /usr/java/latest/bin/javaws 200000
RUN alternatives --install /usr/bin/javac javac /usr/java/latest/bin/javac 200000

ENV JAVA_HOME /usr/java/latest

EXPOSE 2222

LABEL name="CentOS Base Image with Java8"

CMD ["/bin/bash"]
