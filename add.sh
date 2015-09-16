#/bin/bash

set -e

OLD=`gpg -d passwords.txt.gpg`
NEW=`echo "$OLD
$1"`

echo -e "$NEW" | gpg -c > passwords.txt.gpg.tmp
mv passwords.txt.gpg.tmp passwords.txt.gpg
