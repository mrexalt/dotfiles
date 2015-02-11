#!/bin/bash
SLASHDOTRSS=`rsstail -u http://rss.slashdot.org/Slashdot/slashdot -NH1`
if [ -n "${SLASHDOTRSS}" ]; then
	echo "${SLASHDOTRSS}" > /tmp/slashdot_rss.txt
fi

# Strip leading space from rsstail
perl -pi -e 's/^ //g' /tmp/slashdot_rss.txt
# Double newlines for xscreensaver beauty
perl -pi -e 's/\n/\n\n/g' /tmp/slashdot_rss.txt
# Strip vestigial markup
perl -pi -e 's/\<\/em\>//g' /tmp/slashdot_rss.txt
