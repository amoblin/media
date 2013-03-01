#!/usr/bin/python
# author: amoblin <amoblin@gmail.com>
# Note:
# This file is auto generated by Marboo from /media/file_types/gallery.init.py
# If you want to change the image gallery UI, modify the file /media/bin/gallery.py.sh

import os
import mimetypes
mimetypes.init()

source = os.path.join(os.path.expanduser("~"), ".marboo/source")

def get_url_path(path):
    return path.replace(source, "")

dir_name = ".".join(__file__.split(".")[:-2])
if dir_name:
    print "<h3> %s gallery </h3>" % os.path.basename(dir_name)
    for filename in os.listdir( dir_name ):
        mime = mimetypes.guess_type(filename)[0]
        if mime and mime.split("/")[0] == "image":
            url_path = os.path.join(get_url_path(dir_name), filename)
            print """        <div class="span4">
            <a href="%s">
                <img src="%s">
            </a>
            <p> %s </p>
        </div>""" % (url_path, url_path, filename)
