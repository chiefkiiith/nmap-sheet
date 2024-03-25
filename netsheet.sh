### code created by chiefkiiith
### 31 August 2023
### https://github.com/chiefkiiith
### Simple cheatsheet for nmap scripts(nothing too complicated)

#!/bin/bash

echo "--------------------------------"
echo   -e "\033[31;43;1m NETWORK SCAN CHEATSHEET\033[0m" 
echo "--------------------------------"

scan_options=("SERVICE DETECTION"  "Port 80 Scan" "OS DETECTION" "SYN" "CONNECT" "NULL" "FIN" "XMAS" "IDLE" "AGGRESIVE" "TRACEROUTE" "UDP" "UDP SERVICE" "IP PROTOCOL" "FRAGMENTATION" "PING SWEEP" "REVERSE DNS")

echo "Available Scan Options:"
for i in "${!scan_options[@]}"; do
    echo "$((i+1)). ${scan_options[i]}"
done

read -p "Enter the numbers of the scans you want to run (e.g. 1 2): " selected_numbers

selected_scans=()
for number in $selected_numbers; do
    index=$((number-1))
    if [[ $index -ge 0 && $index -lt ${#scan_options[@]} ]]; then
        selected_scans+=("${scan_options[index]}")
    fi
done

if [[ ${#selected_scans[@]} -eq 0 ]]; then
    echo "No scans selected. Exiting."
    exit 0
fi

echo "Selected Scans: ${selected_scans[@]}"

read -p "Enter the target IP or range: " target

for scan in "${selected_scans[@]}"; do
    case $scan in
        "SERVICE DETECTION")
            echo "Running SERVICE DETECTION Scan..."
            sudo nmap -sV -T4 $target
            ;;
        "Port 80 Scan")
            echo "Running Port 80 Scan..."
            sudo nmap -p 80 -T4 $target
            ;;
        "OS DETECTION")
        echo "Running OS SERVICE DETECTION Scan..."
        sudo nmap -O -T4 $target
            ;;
        "SYN ")
            echo "Running SYN Scan..."
            sudo nmap -sS -T4 $target
            ;;
        "CONNECT")
            echo "Running CONNECT Scan..."
            sudo nmap -sT -T4 $target 
            ;;
         "NULL")
         echo "Running NULL SCAN...."
         sudo nmap -sN -T4 $target
         ;;
         "FIN")
         echo "Running FIN SCAN...."
         sudo nmap -sF -T4 $target
         ;;
         "XMAS")
           echo "Running XMAS SCAN...."
           sudo nmap -sX -T4 $target
           ;;
           "IDLE")
           echo "Running IDLE SCAN...."
           sudo nmap -sI -T4 $target
           ;;
           "AGGRESSIVE")
           echo "Running AGGRESSIVE Scan...."
           sudo nmap -A -T4 $target
           ;;
           "TRACEROUTE")
           echo "Running TRACEROUTE SCAN...."
           sudo nmap --traceroute -T4 $target
           ;;
           "UDP")
           echo "Running UDP SCAN...."
           sudo nmap -sU -T4 $target
           ;;
           "UDP SERVICE")
           echo "Running UDP SERVICE Scan...."
           sudo nmap -sUV -T4 $target
           ;;
           "IP PROTOCOL")
           echo "Running IP PROTOCOL SCAN...."
           sudo nmap -sO -T4 $target
           ;;
           "FRAGMENTATION")
           echo "Running FRAGMENTATION Scan ..."
           sudo nmap -f -T4 $target
           ;;
           "PING SWEEP")
           echo "Running PING SWEEP SCAN...."
           sudo nmap -sn -T4 $target
           ;;
           "REVERSE DNS")
           echo "Running REVERSE DNS SCAN...."
           nmap -R -T4 $target

    esac
done

echo "CHEAT SHEET @ WORK."
