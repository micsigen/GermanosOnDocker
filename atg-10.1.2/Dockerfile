FROM micsigen/weblogic-create-domain:10.3.6
MAINTAINER Balazs Major <majorbalu@gmail.com>

USER root

# environment, it could be deleted after rebuild all images
RUN yum -y install unzip.x86_64

#######################################
# environment variables
#

USER oracle

# environment variable for local location
ENV LOCAL_CONF conf
ENV LOCAL_TOOLS tools

# environment variables for installables
ENV BASE_TMP_PACKAGE_INSTALL /tmp/packages

# environment variables for atg location
ENV ATG_DIR /u01/oracle/atg/atg10.1.2
ENV ATG_HOME $ATG_DIR/home

#######################################
# create directories
RUN mkdir -p $BASE_TMP_PACKAGE_INSTALL && \
	mkdir -p $ATG_DIR

#######################################
# copy ATG
ADD $LOCAL_TOOLS/V35852-01.zip $BASE_TMP_PACKAGE_INSTALL/V35852-01.zip
ADD	$LOCAL_TOOLS/V35860-01.zip $BASE_TMP_PACKAGE_INSTALL/V35860-01.zip
ADD	$LOCAL_TOOLS/SiteBuilder-3.1.2-ATG10.1.jar $BASE_TMP_PACKAGE_INSTALL/SiteBuilder-3.1.2-ATG10.1.jar
ADD $LOCAL_CONF/atg.txt $BASE_TMP_PACKAGE_INSTALL/atg.txt

# unzip oracle zip file for ATG to ATG10.1.2_200RCN.bin
# unzip oracle zip file for ATG Search to ATGSearch10.1.2-Linux64_48RCN.bin
RUN unzip $BASE_TMP_PACKAGE_INSTALL/V35852-01.zip -d $BASE_TMP_PACKAGE_INSTALL && \
	unzip $BASE_TMP_PACKAGE_INSTALL/V35860-01.zip -d $BASE_TMP_PACKAGE_INSTALL && \
	rm $BASE_TMP_PACKAGE_INSTALL/V35852-01.zip && \
	rm $BASE_TMP_PACKAGE_INSTALL/V35860-01.zip

# make ATG10.1.2_200RCN.bin and ATGSearch10.1.2-Linux64_48RCN.bin executable for install
RUN chmod +x $BASE_TMP_PACKAGE_INSTALL/ATG10.1.2_200RCN.bin && \
	chmod +x $BASE_TMP_PACKAGE_INSTALL/ATGSearch10.1.2-Linux64_48RCN.bin

RUN cat $BASE_TMP_PACKAGE_INSTALL/atg.txt | $BASE_TMP_PACKAGE_INSTALL/ATG10.1.2_200RCN.bin

#######################################
# copy jdbc driver to jboss location
# ADD $LOCAL_TOOLS/ojdbc6.jar /appl/jboss-eap-5.1.2/jboss-as/lib/ojdbc6.jar

#######################################
# DONE

CMD ["startWebLogic.sh"]
