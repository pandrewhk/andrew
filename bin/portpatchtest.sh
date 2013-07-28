#!/bin/sh
cd /usr/ports
WRKDIRPREFIX=/home/sat/patchtest
for i in `echo */*/files/patch-*|tr " " "\n"|cut -f-2 -d\/|sort -u`;do
  cd /usr/ports/$i
  make clean -DNOCLEANDEPENDS
  make patch||next
  find `make -V PATCH_WRKSRC` -name \*.orig|sed -e 's|.orig$||'|xargs md5>>/tmp/patch.md5sums
  make clean -DNOCLEANDEPENDS
done
