FROM scratch
MAINTAINER Olumide Ajiboye <olumideajiboye@yahoo.com>

ADD centos-7-kinihun.tar.xz /
RUN yum update -y && yum upgrade -y
RUN yum install -y wget vim curl

ENV JAVA_VERSION 8u131
ENV BUILD_VERSION b11
ENV BUILD_TOKEN d54c1d3a095b4ff2b6607d096fa80163
# Downloading Java
RUN wget --no-cookies --no-check-certificate --header "Cookie: oraclelicense=accept-securebackup-cookie" "http://download.oracle.com/otn-pub/java/jdk/$JAVA_VERSION-$BUILD_VERSION/$BUILD_TOKEN/jdk-$JAVA_VERSION-linux-x64.rpm" -O /tmp/jdk-8-linux-x64.rpm

RUN yum localinstall -y /tmp/jdk-8-linux-x64.rpm && rm -f /tmp/jdk-8-linux-x64.rpm && yum clean all

RUN alternatives --install /usr/bin/java java /usr/java/latest/bin/java 200000
RUN alternatives --install /usr/bin/javaws javaws /usr/java/latest/bin/javaws 200000
RUN alternatives --install /usr/bin/javac javac /usr/java/latest/bin/javac 200000

ENV JAVA_HOME /usr/java/latest

EXPOSE 2222

LABEL name="CentOS Base Image with Java8"

CMD ["/bin/bash"]
