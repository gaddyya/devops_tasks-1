#!/bin/bash

CLIENT_LIMIT=200000
SERVER_LIMIT=200000


CLIENT_FILE=/opt/400.log
SERVER_FILE=/opt/500.log
LOGS_SOURCE_FILE=/var/log/nginx/access.log

touch $CLIENT_FILE
touch $SERVER_FILE

CURRENT_DATE=`date`

CLIENT_SIZE=$(wc -c "$CLIENT_FILE" | awk '{print $1}')
SERVER_SIZE=$(wc -c "$SERVER_FILE" | awk '{print $1}')
CLEANUP_FILE=/opt/cleanup.log

if [[ $CLIENT_SIZE -gt $CLIENT_LIMIT ]]
then
  echo -n > $CLIENT_FILE
  echo "$CURRENT_DATE Log file with 4XX errors was successfully cleared" >> $CLEANUP_FILE
else
  awk ' $9 >= 400 && $9 < 500 {print $0}' $LOGS_SOURCE_FILE >> $CLIENT_FILE
fi

if [[ $SERVER_SIZE -gt $SERVER_LIMIT ]]
then
  echo -n > $SERVER_FILE
  echo "$CURRENT_DATE Log file with 5XX errors was successfully cleared" >> $CLEANUP_FILE
else
  awk ' $9 >= 500 && $9 < 527 {print $0}' $LOGS_SOURCE_FILE >> $SERVER_FILE
fi


