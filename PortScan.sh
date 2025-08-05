#!/bin/bash

function ctrl_c(){
  echo -e "\n[+] Saliendo ...\n"
  tput cnorm; exit 1
}

#CTRL+c
trap ctrl_c INT

tput civis #Oculta el cursor
for port in $(seq 1 65535); do 
  (echo '' > /dev/tcp/127.0.0.1/$port) 2>/dev/null && echo "[+] $port -> OPEN"
done;

tput cnorm #Recuperamos el cursor