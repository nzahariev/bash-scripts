#!/bin/bash

# Get the expiration date
data=`echo | openssl s_client -servername $1 -connect $1:443 2>/dev/null | openssl x509 -noout -enddate | sed -e 's#notAfter=##'`
# Convert into seconds
ssldate=`date -d "${data}" '+%s'`
# Get the current date in seconds
nowdate=`date '+%s'`
# Print the difference in days
diff="$((${ssldate}-${nowdate}))"
echo $((${diff}/86400))
