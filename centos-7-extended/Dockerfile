# 
FROM tutum/centos:centos7

# Maintainer
# ----------
MAINTAINER Balazs Major <majorbalu@gmail.com>

RUN yum -y install wget && \
	yum -y install sudo && \
    yum -y install tar && \
    yum -y install unzip.x86_64 && \
    yum -y install glibc.i686

# Installs Ant
ENV ANT_VERSION 1.9.4
RUN cd /tmp && \
    wget -q http://archive.apache.org/dist/ant/binaries/apache-ant-${ANT_VERSION}-bin.tar.gz && \
    tar -xzf apache-ant-${ANT_VERSION}-bin.tar.gz && \
    mv apache-ant-${ANT_VERSION} /opt/ant && \
    rm -f apache-ant-${ANT_VERSION}-bin.tar.gz

ENV ANT_HOME /opt/ant
ENV PATH ${PATH}:/opt/ant/bin

EXPOSE 22
CMD ["/run.sh"]