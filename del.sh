#/bin/bash

set -e

# Usage: del ENTRY

if [[ "$1" =~ [^a-z0-9] || "x$1" == "x" ]]
then
	echo ENTRY should be lower case
	exit 1
fi

ENTRY=$1

OLD=`gpg -d passwords.txt.gpg`
NEW=`echo "$OLD
$1"`

echo -e "$NEW" | sed -n '/$1/!p' | gpg -c > passwords.txt.gpg.tmp
mv passwords.txt.gpg.tmp passwords.txt.gpg
