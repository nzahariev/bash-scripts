#!/bin/bash

# Will display "up" or "down" as a current status of the website
FAIL_CODE=6

check_status(){
    curl -sf "${1}" > /dev/null

    if [ ! $? = ${FAIL_CODE} ];then
        echo -e "up"
    else
        echo -e "down"
    fi
}
