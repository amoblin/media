#!/bin/sh
# author: amoblin <amoblin@gmail.com>
# file name: convert.init.sh
# create date: 2013-03-07 15:15:19
# This file is created from ~/.marboo/source/media/file_init/default.init.sh
# 本文件由 ~/.marboo/source/media/file_init/default.init.sh　复制而来

name=`basename "$1"`
tmp_file=/tmp/$name.html
#cat "$1"
#./router.convert.sh $tmp_file
./org2html.el -infile "$1" -outfile ${tmp_file}
cat ${tmp_file}
rm -f ${tmp_file}
