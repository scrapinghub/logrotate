#!/bin/bash -x

apt-get update && apt-get install automake libtool autoconf build-essential

debuild --no-lintian -us -uc -b

FILENAME=`basename ../*deb`
VERSION=`echo $FILENAME | sed "s/logrotate-//;s/.deb$//"`

curl -T ../$FILENAME -u$BINTRAY_USER:$BINTRAY_APIKEY "https://api.bintray.com/content/scrapinghub/logrotate/pool/main/l/logrotate/$FILENAME;bt_package=logrotate;bt_version=$VERSION;deb_distribution=precise;deb_component=main;deb_architecture=amd64;publish=1"
