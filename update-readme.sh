#!/bin/sh -e

sed -n "0,/# Usage/ p" README.md > README.new
echo >> README.new
python3 -m abarms.__main__ --help --markdown | sed '
s/^\(#\+\) /#\1 /
s/^\(#\+\) \(abarms[^A-Z[({]*\) [A-Z[({].*/\1 \2/
' >> README.new
mv README.new README.md
pandoc -s -V pagetitle=README -f markdown -t html README.md > README.html
