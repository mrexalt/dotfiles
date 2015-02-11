#!/bin/bash
#
# Youtube ist der slow - leech powers ACTIVATE
#

if [ $# -ne 1 ]; then
	echo "Usage : $0 "
	echo "e.g : $0 http://www.youtube.com/watch?v=D1R-jKKp3NA"
else
	# Naem
	NAEM=`date +%s.flv`

	# Fetch the FLV's URL through youtube-dl, priming cookies and spoofing UA (which doesnt seem to help)
	FLVURL=`youtube-dl \
	--cookies /tmp/cookie.txt \
	--get-url \
	--quiet \
	--user-agent "Mozilla/5.0 (X11; U; Linux x86_64; en-US; rv:1.9.1.16) Gecko/20121207 Iceweasel/3.5.16 (like Firefox/3.5.16)" \
	$1`

	# Leech dat FLV using primed cookies and the same fake UA (even though this doesnt seem to help)
	aria2c \
	--load-cookies=/tmp/cookie.txt \
	--user-agent "Mozilla/5.0 (X11; U; Linux x86_64; en-US; rv:1.9.1.16) Gecko/20121207 Iceweasel/3.5.16 (like Firefox/3.5.16)" \
	--use-head=true \
	--split=25 \
	--min-split-size=1M \
	--max-connection-per-server=4 \
	--out=$NAEM \
	$FLVURL

	echo $NAEM
fi
