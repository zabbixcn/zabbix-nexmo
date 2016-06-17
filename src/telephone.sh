#!/usr/bin/env bash

api_key=$1
api_secret=$2
to=$3
text=$4
repeat=$5
from=$6

curl 'https://api.nexmo.com/tts/json' \
	-d "api_key=$api_key" \
	-d "api_secret=$api_secret" \
	-d "to=$to" \
	-d "repeat=$repeat" \
	-d "from=$from" \
	--data-urlencode "text=$text"
