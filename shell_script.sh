#!/bin/bash
# Program : shell_script.sh
# Developer : Neva
# Date : 19.07.01

user="asm"
addr="pwnable.kr"
port="2222"

# MANUAL
if (($# < 1)); then  
	echo "[*] SHELL_SCRIPT FOR PWNABLE"
	echo "[+] 1. ssh"
	echo "[+] 2. scp (whth path, filename argument)"
	echo "       -> .sh 2 {path} {filename} {filename} ..." 
	exit

# CONNECTION
# example) ssh asm@pwnable.kr -p2222
elif (($1 == 1)); then 
	ssh ${user}@${addr} -p${port}

# DOWNLOAD
# example) scp -P 2222 asm@pwnable.kr:/home/asm/asm.c ./
elif (($1 == 2)); then 
	if (($# < 3)); then
		echo "To Need More Arguments"
		exit
	fi

	args=("$@")
	path=$2
	for ((i=2; i<$#; i++)); do
		scp -P ${port} ${user}@${addr}:${path}${args[$i]} ./
		echo "[+] Downloaded" ${args[$i]} 
	done
fi
