#!/bin/sh
wget -q -O ~/twget.tmp \
--header='X-Twitter-Client: Twiget' \
--header='X-Twitter-Client-URL: http://wiki.cenkes.org/Cenkes/Twiget' \
--header='X-Twitter-Client-Version: 0.0.1' \
--auth-no-challenge \
--http-user=infofarmer \
--post-data=source=curl\&status="$*" \
https://twitter.com/statuses/update.json
