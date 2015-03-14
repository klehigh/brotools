#!/usr/bin/env bash

# Provide field numbers for Bro logs
# Author: Keith Lehigh <klehigh@iu.edu>

# use bash strict mode
set -euo pipefail
IFS=$'\n\t'

PROGNAME='bro_field_counter'

VERSION=0.1

# get our log from 1st positional parameter
log=${1:-}

# initialize our counter
count=1; 

usage() {
	cat << USAGE
$PROGNAME - $VERSION
	
$PROGNAME <log>

Provide count of bro fields for any given log.

Only supports one log as argument, but supports any bro
with intact headers.

USAGE

}

# fail immediately if we don't get a log
if [[ -z $log ]];
then
	usage
	exit 1
fi

# temporarily unset exit immediately mode
set +e

# test our log for gzip-ness and get fields into a variable, with #fields chopped off
if file $log |grep -q gzip 
then
	fields=$(zcat $log |egrep '^#fields' |sed 's/#fields//')
else
	fields=$(head $log |egrep '^#fields' |sed 's/#fields//')
fi
# back to exit immediately mode
set -e

# if our fields variable is zero length something went wrong.  let's bail.
if [[ -z $fields ]]
then
	echo "no fields line found at start of $log."
	usage
	exit 1
fi

# now, loop through our fields & print a counter
for i in $fields
do
	echo -e "$count\t$i" ; count=$((count+1));
done

# pedantic, I know
exit 0
