#!/bin/bash
# Add Opsview Host icons from James collection without hassle;)
# Karsten Mueller <k.mueller@metaways.de> - 2012-03-02

if [ $(id -un) != "nagios" ]; then
 echo "run this as user nagios!"
 exit 1
fi

if ! which mogrify >/dev/null; then
 echo "does not found external 'imagemagick' (perhaps not installed?)"
 exit 1
fi
if ! which hosticon_admin >/dev/null; then
 echo "does not found opsview's 'hosticon_admin' command (perhaps /usr/local/nagios/bin is not in your path?)"
 exit 1
fi

echo "processing: "
pushd logos >/dev/null || exit 1
for i in *.png; do
 n=$(basename $i .png)
 printf "$n "
 hosticon_admin add "LOGO - $n" ./$i
done
popd

pushd symbols >/dev/null || exit 1
for i in *.png; do
 n=$(basename $i .png)
 printf "$n "
 hosticon_admin add "SYMBOL - $n" ./$i
done
popd

echo "done."
