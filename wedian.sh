#!/bin/bash
[[ $# = 1 && "$1" == +([0-9]) ]] || { echo "usage: $0 [gameid]"; exit 1; }
turns=$(curl -s "http://webdiplomacy.net/board.php?gameID=$1" | grep -o '&turn=[0-9]*' | cut -c7-)
[ -z $turns ] && { echo game not found; exit 1; }
curl "http://webdiplomacy.net/map.php?gameID=$1&turn=[0-$turns]&mapType=large" -o 'wedian#1.png'
eval "convert -layers OptimizePlus -delay 50 wedian{0..$turns}.png -loop 0 wedian.gif"
