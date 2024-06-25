#!/bin/bash

q=/Users/j/Lib/q/m64/q
dash=/Users/j/Lib/dash

SYM=sym
HDB_PORT=5009
TP_PORT=5010
RDB_PORT=5011
RPT_PORT=5013
DSH_PORT=10001

start_processes() {

    echo "Starting HDB..."
    $q hdb.q -p $HDB_PORT &
    hdb_pid=$!
    sleep 1

    echo "Starting TP..."
    $q tick.q $SYM . -p $TP_PORT &
    tp_pid=$!
    sleep 1
    
    echo "Starting RDB..."
    $q tick/r.q :$TP_PORT -p $RDB_PORT &
    rdb_pid=$!
    sleep 1

    echo "Starting DASH..."
    cd $dash
    $q dash.q -p $DSH_PORT -u 1 &
    dsh_pid=$!
    sleep 1
    cd -

    echo "Starting RPT..."
    $q tick/rpt.q :$TP_PORT -p $RPT_PORT &
    rpt_pid=$!

    echo "Starting FH..."
    $q fh.q :$TP_PORT &
    fh_pid=$!
    sleep 1
    
    trap 'kill_processes' EXIT
}

kill_processes() {
    echo "Stopping all components..."
    kill $fh_pid $rpt_pid $dsh_pid $rdb_pid $tp_pid $hdb_pid
    echo "Processes stopped."
}

echo "Starting tick system..."
start_processes

while true; do
    sleep 1
done

