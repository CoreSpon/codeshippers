#!/bin/bash


#put your subnet here
subnet=192.168.1

echo "this will take 2 mins and 30 seconds"
sleep 3

#Begin the for loop here search 4th octet from 1 - 20
for x in  `seq 1 20`; do


#Only search for one second and get output of machines that are alive only
ping -c 1 $subnet.$x | grep "64 bytes" >>machines_alive.txt
done


#Give the user 5 seconds of time to react 
sleep 5
echo "now displaying all machines on the subnet of 192.168.1.0"


#To make the output look fancy we can uncomment the line below
cut -d ':' -f 1 machines_alive.txt 

#Delete the log file (feel free to comment out the next statement to keep a history of machines alive)
rm machines_alive.txt
