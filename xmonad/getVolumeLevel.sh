#!/bin/sh
amixer sget Master | grep -q -o -m 1 '\[off\]' && {
    echo "<fc=#FF0000>OFF</fc>"
    exit 0
  }

volume=`amixer sget Master | grep -o -m 1 '[[:digit:]]*%'`
#bars="expr $volume / 10"

#case $bars in
#  0)  bar='[----------]' ;;
#  1)  bar='[>---------]' ;;
#  2)  bar='[>>--------]' ;;
#  3)  bar='[>>>-------]' ;;
#  4)  bar='[>>>>------]' ;;
#  5)  bar='[>>>>>-----]' ;;
#  6)  bar='[>>>>>>----]' ;;
#  7)  bar='[>>>>>>>---]' ;;
#  8)  bar='[>>>>>>>>--]' ;;
#  9)  bar='[>>>>>>>>>-]' ;;
#  10) bar='[>>>>>>>>>>]' ;;
#  *)  bar='[----!!----]' ;;
#esac
#
#echo $bar

echo $volume

exit 0

