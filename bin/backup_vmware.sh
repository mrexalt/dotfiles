#!/bin/bash

export PATH='/bin:/usr/bin:/usr/local/bin'
HOMEDIR="/home/${USER}/vmware"
BACKDIR="/media/BACKUPS/$(/bin/hostname -s)/"
DATE=`date +%Y%m%d_%H:%M:%S`

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

/usr/bin/rsync -vaz --quiet --delete ${HOMEDIR} ${BACKDIR}

if [ $? == '0' ]; then
    echo "${DATE} - VMware backup completed successfully." >> /tmp/backup.log
else
    echo "${DATE} - Errors were encountered in VMware backup. Exit status is ${?}" >> /tmp/backup.log
fi

exit 0;
