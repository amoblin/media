#!/bin/sh
# author: amoblin
# create date: Mon Feb  4 23:12:38 2013
# notes:
# 注意：这个脚本极具杀伤力，它会执行后缀为.run.sh的文件，所以请慎重编辑这类文件，
# 建议只写入查询类的命令，不要写入类似 **RM** 之类的危险命令。
# 对于写入危险命令造成的文件丢失，本脚本和本软件以及作者概不负责。

runsh=~/.marboo/source/media/bin/run.sh
$runsh "sh \"$1\""
