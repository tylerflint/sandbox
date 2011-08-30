'yum install -y' \
'gcc' \
'libxml2 libxml2-devel' \
'openssl openssl-devel' \
'curl-devel' \
'libjpeg libjpeg-devel' \
'libpng libpng-devel' \
'freetype freetype-devel' \
'libmcrypt libmcrypt-devel' \
'libmhash libmhash-devel' \
'mysql-devel' \
'autoconf' \


'./configure' \
'--with-config-file-path=/etc/httpd/conf' \
'--with-libdir=/lib64' \
'--enable-fastcgi' \
'--with-jpeg-dir' \
'--with-gd' \
'--with-openssl' \
'--enable-bcmath' \
'--with-curl' \
'--with-png-dir' \
'--with-zlib-dir' \
'--with-mhash' \
'--with-ttf' \
'--with-freetype-dir' \
'--enable-gd-native-ttf' \
'--enable-mbstring' \
'--with-mcrypt' \
'--with-mysql=/usr/bin' \
'--with-pdo-mysql=shared' \
'--with-pdo=shared' \
'--with-mysqli=shared' \
'--bindir=/usr/bin' \
'--enable-soap' \
"$@"
