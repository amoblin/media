#!/bin/sh
# author: amoblin <amoblin@gmail.com>
# file name: convert.init.sh
# create date: 2013-03-07 15:15:19
# This file is created from ~/.marboo/source/media/bin/default.init.sh
# 本文件由 ~/.marboo/source/media/bin/default.init.sh　复制而来

name=`basename "$1"`
tmp_file=/tmp/$name
./feed-parser.py $1 > /dev/null &
./router.convert.sh $1
