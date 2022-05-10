#!/bin/bash

# Get the expiration date
expdate=$(whois $1 | grep -iE 'expir.*date|expir.*on' | head -1 | grep -oE '[^ ]+$')
# Turn it into seconds
expdate=$(date -d"$expdate" +%s)
# Get the current date in seconds
curdate=$(date +%s)
# Print the difference in days
echo $(((expdate-curdate)/86400))
