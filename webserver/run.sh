#! /bin/sh

set -xe

: ${TOKEN:?"TOKEN is required"}
: ${DB_HOST:?"DB_HOST is required"}
: ${DB_USER:?"DB_USER is required"}
: ${DB_PORT:?"DB_PORT is required"}
: ${DB_NAME:?"DB_NAME is required"}
: ${DB_PASS:?"DB_PASS is required"}
: ${DEMOS_CLEAN_TYPE:?"DEMOS_CLEAN_TYPE is required"}
: ${DEMOS_DAYS_OR_COUNT:?"DEMOS_DAYS_OR_COUNT is required"}
: ${DEMOS_TIME_CLEAR:?"DEMOS_TIME_CLEAR is required"}
: ${DEMOS_UPLOAD_DIR:?"DEMOS_UPLOAD_DIR is required"}

mkdir -p $DEMOS_UPLOAD_DIR

cat Config.json | jq ".token = \"$TOKEN\" | .database={"host": \"$DB_HOST\", "user": \"$DB_USER\", "port": \"$DB_PORT\", "database": \"$DB_NAME\", "password": \"$DB_PASS\"} | .demos={"CleanType": \"$DEMOS_CLEAN_TYPE\", "DaysOrCount": $DEMOS_DAYS_OR_COUNT, "TimeClear": $DEMOS_TIME_CLEAR, "UploadDir": \"$DEMOS_UPLOAD_DIR\"}" > Config.json

cat Config.json

node demos.js
