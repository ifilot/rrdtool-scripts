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
TITLE="Running average cpu loads"

rrdtool graph load.png \
-t "$TITLE" \
-w $WIDTH -h $HEIGHT \
--end now --start end-86400 \
DEF:st=$1:shortterm:AVERAGE \
DEF:mt=$1:midterm:AVERAGE \
DEF:lt=$1:longterm:AVERAGE \
VDEF:stlast=st,LAST \
VDEF:stmin=st,MINIMUM \
VDEF:stmax=st,MAXIMUM \
VDEF:stavg=st,AVERAGE \
VDEF:mtlast=mt,LAST \
VDEF:mtmin=mt,MINIMUM \
VDEF:mtmax=mt,MAXIMUM \
VDEF:mtavg=mt,AVERAGE \
VDEF:ltlast=lt,LAST \
VDEF:ltmin=lt,MINIMUM \
VDEF:ltmax=lt,MAXIMUM \
VDEF:ltavg=lt,AVERAGE \
COMMENT:"            Now      Min     Max     Avg\n" \
LINE1:st#FF0000:"1 min " \
GPRINT:stlast:'%6.2lf' \
GPRINT:stmin:'%6.2lf' \
GPRINT:stmax:'%6.2lf' \
GPRINT:stavg:'%6.2lf\n' \
LINE1:mt#00FF00:"5 min " \
GPRINT:mtlast:'%6.2lf' \
GPRINT:mtmin:'%6.2lf' \
GPRINT:mtmax:'%6.2lf' \
GPRINT:mtavg:'%6.2lf\n' \
LINE1:lt#0000FF:"15 min" \
GPRINT:ltlast:'%6.2lf' \
GPRINT:ltmin:'%6.2lf' \
GPRINT:ltmax:'%6.2lf' \
GPRINT:ltavg:'%6.2lf\n'
