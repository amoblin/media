#!/bin/sh
# author: amoblin <amoblin@gmail.com>
# file name: opml.xml.sh
# create date: 2013-03-14 10:41:52
# This file is created from ~/.marboo/source/media/bin/default.init.sh
# 本文件由 ~/.marboo/source/media/bin/default.init.sh　复制而来

name=`basename "$1"`
tmp_file=/tmp/$name
./opml-parser.py $1 > $tmp_file
./router.convert.sh $tmp_file
