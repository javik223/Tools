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

# Configure Nginx
./configure \
--user=www-data \
--group=www-data \
--with-http_ssl_module \
--with-http_realip_module \
--with-http_addition_module \
--with-http_sub_module \
--with-http_dav_module \
--with-http_flv_module \
--with-http_mp4_module \
--with-http_gunzip_module \
--with-http_gzip_static_module \
--with-http_random_index_module \
--with-http_secure_link_module \
--with-http_stub_status_module \
--with-mail \
--with-mail_ssl_module \
--with-file-aio \
--with-http_spdy_module \
--with-cc-opt='-g -O2 -fstack-protector --param=ssp-buffer-size=4 -Wformat -Werror=format-security -Wp,-D_FORTIFY_SOURCE=2' \
--with-ld-opt='-Wl,-z,relro -Wl,--as-needed' \
--with-ipv6 \
--with-debug \
--with-openssl=$HOME/openssl-1.0.1j \
--add-module=$HOME/ngx_pagespeed-release-${NPS_VERSION}-beta \
--add-module=$HOME/ngx_cache_purge && 


# Make the package.
make && 

# Make install
make install