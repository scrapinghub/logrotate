#!/bin/sh

debuild --no-lintian -us -uc -b

curl -T ../*deb -u$BINTRAY_USER:$BINTRAY_APIKEY
