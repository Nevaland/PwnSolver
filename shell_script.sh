#!/bin/bash
# Program : shell_script.sh
# Developer : Neva
# Date : 19.07.01

user="unlink"
addr="pwnable.kr"
port="2222"
password="guest"

# MANUAL
if (($# < 1)); then  
	echo "[*] SHELL_SCRIPT FOR PWNABLE"
	echo "[+] 1. ssh"
	echo "[+] 2. scp (whth path, filename argument)"
	echo "       -> .sh 2 {path} {filename} {filename} ..."
	echo "       or .sh 2 {path}" 
	exit

# CONNECTION
# example) ssh asm@pwnable.kr -p2222
elif (($1 == 1)); then 
	#ssh ${user}@${addr} -p${port}
	expect -c "spawn ssh ${user}@${addr} -p${port}" \
	-c "expect -re \"password:\"" \
	-c "send ${password}\r" \
	-c "interact"

# DOWNLOAD
# example) scp -P 2222 asm@pwnable.kr:/home/asm/asm.c ./
elif (($1 == 2)); then 
	if (($# < 2)); then
		echo "To Need More Arguments"
		exit
	elif (($# == 2)); then	
		expect -c "spawn scp -r -P ${port} ${user}@${addr}:${path} ./" \
		-c "expect -re \"password:\"" \
		-c "send ${password}\r" \
		-c "interact"
		echo "[+] Downloaded" ${args[$i]} 
		exit	
	fi

	args=("$@")
	path=$2
	for ((i=2; i<$#; i++)); do
		expect -c "spawn scp -P ${port} ${user}@${addr}:${path}${args[$i]} ./" \
		-c "expect -re \"password:\"" \
		-c "send ${password}\r" \
		-c "interact"
		echo "[+] Downloaded" ${path}
	done
fi
