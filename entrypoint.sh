#!/bin/bash

echo "APP RUNNING";
ls

echo "INPUT DIRECTORY CONTENT";
ls -a /iexec_in;

echo "OUTPUT DIRECTORY INITIAL CONTENT";
ls -a /iexec_out;

echo "READING IEXEC ARGS";
args=$@
echo $args;

echo 'READING IEXEC RUNTIME VARIABLES';
echo ' - IEXEC_INPUT_FILES_FOLDER='$IEXEC_INPUT_FILES_FOLDER;
echo ' - IEXEC_NB_INPUT_FILES='$IEXEC_NB_INPUT_FILES;
if [ "$IEXEC_NB_INPUT_FILES" -ge 1 ]; # print IEXEC_INPUT_FILE_NAME_X
then
    i=1;
    while [ $i -le $IEXEC_NB_INPUT_FILES ]
    do
       name='IEXEC_INPUT_FILE_NAME_'$i
       eval "value=\"\$$name\""
       echo '     - '$name=$value
       i=`expr $i + 1`
    done
fi
echo ' - IEXEC_DATASET_FILENAME='$IEXEC_DATASET_FILENAME;
echo ' - IEXEC_BOT_SIZE='$IEXEC_BOT_SIZE;
echo ' - IEXEC_BOT_FIRST_INDEX='$IEXEC_BOT_FIRST_INDEX;
echo ' - IEXEC_BOT_TASK_INDEX='$IEXEC_BOT_TASK_INDEX;

FILE1=/iexec_in/$IEXEC_INPUT_FILE_NAME_1
FILE2=/iexec_in/$IEXEC_INPUT_FILE_NAME_2
echo "app input files:"
echo $FILE1
echo $FILE2

echo "start program"

python main.py $1 -p /iexec_out/
echo "end program"
echo "CREATING determinism.txt IN /iexec_out/";
echo "ok" > /iexec_out/determinism.txt && echo "done";
echo "{ \"deterministic-output-path\" : \"/iexec_out/determinism.txt\" }" > /iexec_out/computed.json
echo "OUTPUT DIRECTORY FINAL CONTENT";
ls -a /iexec_out;
echo "FINISH";
