# 
FROM oraclelinux:7

# Maintainer
# ----------
MAINTAINER Balazs Major <majorbalu@gmail.com>

RUN yum -y update && \
	yum -y wget && \
	yum -y install ant && \
	yum -y install unzip.x86_64 && \
	yum -y install tar.x86_64

RUN echo "root:Docker" | chpasswd

EXPOSE 22
CMD ["/bin/bash"]