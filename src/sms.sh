#!/usr/bin/env bash

api_key=$1
api_secret=$2
to=$3
from=$4
text=$5

curl 'https://rest.nexmo.com/sms/json' \
	-d "api_key=$api_key" \
	-d "api_secret=$api_secret" \
	-d "to=$to" \
	-d "from=$from" \
	--data-urlencode "text=$text"
