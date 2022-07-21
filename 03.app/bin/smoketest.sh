#!/bin/bash

status=`curl --silent --head $1 | head -1 | cut -f 2 -d' '`
if [ "$status" != "200" ]
then
    echo "status was other than '200': was '$status'"
    exit 1
fi

