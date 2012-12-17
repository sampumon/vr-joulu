#!/bin/bash
#
# Nuclear_meltdown_preventer.sh
#
# This is really important stuff. Don't edit it!
#
. ticktick.sh

list_all_offers () {
	for d in $(seq 1 24); do
		eval echo $d. \$__tick_data_door${d}_offer
	done
}

joulu="http://netapps.fi/joulukalenteri/"
today=$(date +%-d)

kalendar=$(curl -s $joulu | grep "var global_calendar" | tr -d \; | sed 's/var global_calendar = //')

# LOL UNICODE ESCAPES (\u00e4 etc)
# BTW. Ubuntu 10.04 has too old ECHO. 12.04 working smoothly.
# http://stackoverflow.com/questions/8795702/how-to-convert-uxxxx-unicode-to-utf-8-using-console-tools-in-nix
kalendar=$(echo -e $kalendar | iconv -f iso8859-1)

# echo DEBUG $kalendar 
tickParse "$kalendar"

# NOTE: the following causes a bash variable dereferencing paradox and fails
# echo ``door$today.offer``

list_all_offers
