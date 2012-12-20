#!/bin/bash
#
# Nuclear_meltdown_preventer.sh
#
# This is really important stuff. Don't edit it!
#
ticktick=ticktick.sh
which -s $ticktick || {	
	ticktick=$(dirname $0)/$ticktick
	which -s $ticktick || {
		echo >&2 "ticktick.sh is required, go to http://github.com/kristopolous/TickTick"
		exit 1
	}
}

echo DEBUG using $ticktick
. $ticktick

list_all_offers () {
	# NOTE: the following causes a bash variable dereferencing paradox and fails
	# echo ``door$today.offer``
	for (( d=1; d<25; d++ )); do
		eval echo $d. \$__tick_data_door${d}_offer
	done
}

joulu="http://netapps.fi/joulukalenteri/"
today=$(date +%-d)

kalendar=$(curl -s $joulu | grep "var global_calendar" | tr -d \; | sed 's/var global_calendar = //')

# LOL THE UNICODE ESCAPES (\u00e4 etc)
# NOTE: requires BASH-4.2 for "echo -e" unicode escapes. Ubuntu 12.04 has it.
# http://stackoverflow.com/questions/8795702/how-to-convert-uxxxx-unicode-to-utf-8-using-console-tools-in-nix
kalendar=$(echo -e $kalendar | iconv -f iso8859-1)

tickParse "$kalendar"

list_all_offers
