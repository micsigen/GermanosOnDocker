FROM micsigen/weblogic-create-domain:10.3.6
MAINTAINER Balazs Major <majorbalu@gmail.com>

#######################################
# Environment variables
#
USER oracle

# Environment variable for local location
ENV LOCAL_CONF conf
ENV LOCAL_TOOLS tools

# Environment variables for installables
ENV BASE_TMP_PACKAGE_INSTALL /tmp/packages

# Environment variables for atg location
ENV DYNAMO_ROOT /u01/oracle/atg/atg10.1.2
ENV DYNAMO_HOME $DYNAMO_ROOT/home
ENV HOSTNAME localhost
ENV ANT_HOME /opt/ant
ENV PATH ${PATH}:/opt/ant/bin
ENV JAVA_VM ${JAVA_HOME}/bin/java

ENV PRODUCTION_PORT 7003
ENV PUBLISHING_PORT 7004

#######################################
# create directories
RUN mkdir -p $BASE_TMP_PACKAGE_INSTALL && \
	mkdir -p $DYNAMO_ROOT

#######################################
# copy ATG
ADD $LOCAL_TOOLS/V35852-01.zip $BASE_TMP_PACKAGE_INSTALL/V35852-01.zip
ADD	$LOCAL_TOOLS/V35860-01.zip $BASE_TMP_PACKAGE_INSTALL/V35860-01.zip
ADD $LOCAL_TOOLS/V35854-01.zip $BASE_TMP_PACKAGE_INSTALL/V35854-01.zip
ADD	$LOCAL_TOOLS/SiteBuilder-3.1.2-ATG10.1.jar $BASE_TMP_PACKAGE_INSTALL/SiteBuilder-3.1.2-ATG10.1.jar
ADD $LOCAL_CONF/atg.txt $BASE_TMP_PACKAGE_INSTALL/atg.txt
ADD $LOCAL_CONF/search.txt $BASE_TMP_PACKAGE_INSTALL/search.txt
ADD $LOCAL_CONF/service.txt $BASE_TMP_PACKAGE_INSTALL/service.txt
ADD $LOCAL_TOOLS/SiteBuilderLicense.properties $BASE_TMP_PACKAGE_INSTALL/SiteBuilderLicense.properties

# unzip oracle zip file for ATG to ATG10.1.2_200RCN.bin
# unzip oracle zip file for ATG Search to ATGSearch10.1.2-Linux64_48RCN.bin
# unzip oracle zip file for ATG CSR to ATG-Service10.1.2_81RCN.bin
RUN unzip $BASE_TMP_PACKAGE_INSTALL/V35852-01.zip -d $BASE_TMP_PACKAGE_INSTALL && \
	unzip $BASE_TMP_PACKAGE_INSTALL/V35860-01.zip -d $BASE_TMP_PACKAGE_INSTALL && \
	unzip $BASE_TMP_PACKAGE_INSTALL/V35854-01.zip -d $BASE_TMP_PACKAGE_INSTALL && \
	rm $BASE_TMP_PACKAGE_INSTALL/V35852-01.zip && \
	rm $BASE_TMP_PACKAGE_INSTALL/V35860-01.zip && \
	rm $BASE_TMP_PACKAGE_INSTALL/V35854-01.zip

# make ATG10.1.2_200RCN.bin, ATGSearch10.1.2-Linux64_48RCN.bin and ATG-Service10.1.2_81RCN.bin executable for install
RUN chmod +x $BASE_TMP_PACKAGE_INSTALL/ATG10.1.2_200RCN.bin && \
	chmod +x $BASE_TMP_PACKAGE_INSTALL/ATGSearch10.1.2-Linux64_48RCN.bin && \
	chmod +x $BASE_TMP_PACKAGE_INSTALL/ATG-Service10.1.2_81RCN.bin

RUN cat $BASE_TMP_PACKAGE_INSTALL/atg.txt | $BASE_TMP_PACKAGE_INSTALL/ATG10.1.2_200RCN.bin
RUN cat $BASE_TMP_PACKAGE_INSTALL/search.txt | $BASE_TMP_PACKAGE_INSTALL/ATGSearch10.1.2-Linux64_48RCN.bin
RUN cat $BASE_TMP_PACKAGE_INSTALL/service.txt | $BASE_TMP_PACKAGE_INSTALL/ATG-Service10.1.2_81RCN.bin
RUN mv $BASE_TMP_PACKAGE_INSTALL/SiteBuilder-3.1.2-ATG10.1.jar $DYNAMO_ROOT/SiteBuilder-3.1.2-ATG10.1.jar
RUN cd $DYNAMO_ROOT && \
 	jar -xf SiteBuilder-3.1.2-ATG10.1.jar

RUN rm $BASE_TMP_PACKAGE_INSTALL/ATG10.1.2_200RCN.bin && \
	rm $BASE_TMP_PACKAGE_INSTALL/ATGSearch10.1.2-Linux64_48RCN.bin && \
	rm $BASE_TMP_PACKAGE_INSTALL/ATG-Service10.1.2_81RCN.bin && \
	rm $DYNAMO_ROOT/SiteBuilder-3.1.2-ATG10.1.jar && \
	rm $BASE_TMP_PACKAGE_INSTALL/atg.txt && \
	rm $BASE_TMP_PACKAGE_INSTALL/search.txt && \
	rm $BASE_TMP_PACKAGE_INSTALL/service.txt

# Important environment variables
RUN echo JAVA_VM=${JAVA_HOME}/bin/java >> /u01/oracle/.bashrc && \ 
 	echo ANT_HOME=/opt/ant >> /u01/oracle/.bashrc

EXPOSE $PRODUCTION_PORT $PUBLISHING_PORT

WORKDIR /u01/oracle/atg/atg10.1.2

#######################################
# DONE

USER root

# Environment folders
RUN mkdir /opt/atg/ && \
	mkdir /opt/atg/build && \
	chown oracle:oracle -R /opt/atg/

CMD ["/start-services.sh"]
