#!/bin/bash

export PATH='/bin:/usr/bin:/usr/local/bin'
HOMEDIR="/home/${USER}/"
BACKDIR="/media/BACKUPS/$(/bin/hostname -s)/"
DATE=`date +%Y%m%d_%H:%M:%S`
STAMP=`date +%Y%m%d`
OLDSTAMP=`date +%Y%m%d -d '3 months ago'`

# test for srcdir
if [ ! -d ${HOMEDIR} ]; then
	echo "ERROR: Homedir ${HOMEDIR} doesn't exist!"
	exit 1
fi

# test for mount
if [ ! -d ${BACKDIR} ]; then
	echo "ERROR: Backup dir ${BACKDIR} doesn't exist!"
	exit 1
fi

# test for writable
if [ ! -w ${BACKDIR} ]; then
	echo "ERROR: User ${USER} lacks write permission for dir ${BACKUPDIR}"
	exit 1
fi

/bin/tar -cf /media/BACKUPS/${HOSTNAME}_${STAMP}.tar.gz ${BACKDIR} 
/bin/rm -f /media/BACKUPS/${HOSTNAME}_${OLDSTAMP}.tar.gz

if [ $? == '0' ]; then
	echo "${DATE} - Monthly backup cut completed successfully." >> /tmp/backup.log
else
	echo "${DATE} - Errors were encountered in monthly backup cut. Exit status is ${?}" >> /tmp/backup.log
fi

exit 0;
