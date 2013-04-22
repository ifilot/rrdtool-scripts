#
# rrdtool script
#
# usage: ./processor.sh <FILENAME>
#
# example: ./processor /var/lib/rrdtool/host/load.
#
# Author; Ivo Filot
# Contact: ivo@zuidstijl.nl
#

rrdtool graph load.png \
-t "Running average cpu loads" \
-w 400 -h 200 \
--end now --start end-86400 \
DEF:st=$1:shortterm:AVERAGE \
DEF:mt=$1:midterm:AVERAGE \
DEF:lt=$1:longterm:AVERAGE \
LINE1:st#FF0000:"1 min" \
LINE1:mt#00FF00:"5 min" \
LINE1:lt#0000FF:"15 min"
