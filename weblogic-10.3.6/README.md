This repository stores general pourpose Docker images.

This is the Dockerfile for a default installation for Oracle WebLogic Server 11g (10.3.6) Generic Distribution.

IMPORTANT
-----------------------------------------
The resulting image of this Dockerfile DOES NOT contain a WLS Domain.
For that, you must to create a domain on a new inherited image.

REQUIRED FILES TO BUILD THIS IMAGE
-----------------------------------------
(1) wls1036_generic.jar (Oracle WebLogic Server 10.3.6 Generic Installer)

(2) jdk-7u79-linux-x64.rpm (Oracle Java SE Development Kit 7 for Linux x64 RPM)

HOW TO BUILD THIS IMAGE
-----------------------------------------
Put all downloaded files in the same directory as this Dockerfile
Run: 
      $ sudo docker build -t micsigen/weblogic:10.3.6 . 