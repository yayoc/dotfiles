#!/bin/sh

DATE=$(date "+%Y%m%d")
YESTERDAY=$(date -v -1d "+%Y%m%d")

FILE_PATH="/Users/yayoc/Dropbox/Documents/Journal/$DATE.md"

echo "# $DATE" >> $FILE_PATH

