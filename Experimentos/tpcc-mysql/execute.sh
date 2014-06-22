#!/bin/bash

HOST=$1
WAREHOUSES=$2
TERMINALS=$3
TEST_NAME=$4
LOG_FILE=./log/tpcc-$TEST_NAME.log
STATS_FILE=./log/stats-$TEST_NAME

# The date the test has executed
#
DATE=$(date +"%F")

# Wipe sysstat log files in order do ease data collection for 2+ different runs at the same day
#
echo Enabling systat on target host...
ssh $HOST "rm -rf /var/log/sysstat/*"

# Enable sysstat
#
ssh $HOST "sed -i -e 's/ENABLED=\"false\"/ENABLED=\"true\"/g' /etc/default/sysstat"
echo Done. Waiting for first measures...

# Wait for the first measurements to take place
#
sleep 90s
echo Done. Starting test...

# The time the test has started
#
START=$(date +"%H:%M:%S")

# Execute the test
#
./tpcc_start -h$HOST -dtpcc -uroot -p password -w$WAREHOUSES -c$TERMINALS -r1200 -l7200 > $LOG_FILE
echo Done. Test is over.

# The time the test has finished
#
FINISH=$(date +"%H:%M:%S")

# Wait for the last measurements to take place
#
echo Waiting last measures...
sleep 30s
echo Done. Disabling sysstat...
# Disable sysstat
#
ssh $HOST "sed -i -e 's/ENABLED=\"true\"/ENABLED=\"false\"/g' /etc/default/sysstat"
echo Done.

echo Preparing log file...

# Brings sysstat binary log files from remote host
#
scp $HOST:/var/log/sysstat/sa* $STATS_FILE > /dev/null

AVG_IDLE_CPU=$(sar -f $STATS_FILE -s $START -e $FINISH | tail -1 | awk '{print $8}')
AVG_COMMIT=$(sar -r -f $STATS_FILE -s $START -e $FINISH | tail -1 | awk '{print $8}')

echo Start: $DATE $START   -    Finish: $DATE $FINISH >> $LOG_FILE
echo AVG Idle CPU: $AVG_IDLE_CPU >> $LOG_FILE
echo AVG Commit: $AVG_COMMIT >> $LOG_FILE

echo "Done. Test run FINISHED! ($DATE $FINISH)"

