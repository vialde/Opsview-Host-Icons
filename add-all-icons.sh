#!/bin/bash
# Add Opsview Host icons from James collection without hassle;)
# Karsten Mueller <karsten.mueller@linux-solution-park.de> - 2010-03-25

if [ $(id -un) != "nagios" ]; then
 echo "run this as user nagios!"
 exit 1
fi

echo "processing: "
pushd logos >/dev/null || exit 1
for i in *.gif; do
 n=$(basename $i .gif)
 printf "$n "
 hosticon_admin add "LOGO - $n" ./$i
done
popd

pushd symbols >/dev/null || exit 1
for i in *.gif; do
 n=$(basename $i .gif)
 printf "$n "
 hosticon_admin add "SYMBOL - $n" ./$i
done
popd

echo "done."
