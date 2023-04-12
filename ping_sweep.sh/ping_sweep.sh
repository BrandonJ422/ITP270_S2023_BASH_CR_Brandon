#!/bin/bash 



echo "Enter the Subnet:"

read Subnet



if [ "$Subnet" == "" ]; then

    echo "Syntax Example = ./ping_sweep.sh 10.1.147"

else

    for IP in $(seq 1 254); do

        ping -c 1 $Subnet.$IP | grep "64 bytes" | cut -d " " -f 4 | tr -d ":" >> discoveredIPS_Jalali.txt &

    done

    wait

    nmap -T4 -sV -A -iL discoveredIPS_Jalali.txt -oN PortScanIPs.txt

fi


