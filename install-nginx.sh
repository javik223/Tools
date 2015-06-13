#!/bin/bash

sudo apt-get install git checkinstall &&  #install git

#install development tools
sudo apt-get install build-essential zlib1g-dev libpcre3 libpcre3-dev unzip &&

# Compile against SSL to enable NPN
wget https://www.openssl.org/source/openssl-1.0.1j.tar.gz && tar -xsvf openssl-1.0.1j.tar.gz  &&

# Download the Cache Purge Module
git clone https://github.com/FRiCKLE/ngx_cache_purge.git &&

# Install Google Page Speed Tool
cd 
NPS_VERSION=1.9.32.3
wget https://github.com/pagespeed/ngx_pagespeed/archive/release-${NPS_VERSION}-beta.zip
unzip release-${NPS_VERSION}-beta.zip
cd ngx_pagespeed-release-${NPS_VERSION}-beta/
wget https://dl.google.com/dl/page-speed/psol/${NPS_VERSION}.tar.gz
tar -xzvf ${NPS_VERSION}.tar.gz


# Install Nginx
NGINX_VERSION=1.9.1
wget http://nginx.org/download/nginx-${NGINX_VERSION}.tar.gz
tar -xvzf nginx-${NGINX_VERSION}.tar.gz
cd nginx-${NGINX_VERSION}/