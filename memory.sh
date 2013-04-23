#!/bin/bash
#
# rrdtool script
#
# usage: ./processor.sh <FILENAME>
#
# example: ./processor /var/lib/rrdtool/host/load.rrd
#
# Author: Ivo Filot
# Contact: ivo@zuidstijl.nl
# GitHub: https://github.com/ifilot/rrdtool-scripts
#
# Description:
# ------------
# Generates a graph of the system load of the past day
# The width and height of the graph can be tuned by
# changing the values below
#

WIDTH=400
HEIGHT=200
TITLE="Memory usage"

rrdtool graph memory.png \
-t "$TITLE" \
-w $WIDTH -h $HEIGHT \
--end now --start end-86400 \
DEF:used=$1:value:AVERAGE \
DEF:free=$2:value:AVERAGE \
CDEF:pused=used,100,*,used,free,+,/ \
AREA:pused#FF0000:"Memory Used"
