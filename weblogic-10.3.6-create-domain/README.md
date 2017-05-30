This repository stores general pourpose Docker images.

This Dockerfile extends a Oracle WebLogic Server image by creating a sample domain.

The domain name will be 'base_domain', created with the default versions for JEE APIs.
The admin server listens port 7001.

IMPORTANT
-----------------------------------------
The resulting image of this Dockerfile DOES NOT contain a WLS Domain.
For that, you must to create a domain on a new inherited image.

HOW TO BUILD THIS IMAGE
-----------------------------------------
Run: 
     $ sudo docker build -t micsigen/weblogic-create-domain:10.3.6 . 