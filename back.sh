#!/bin/zsh

blue="\e[0;34m\033[1m"
green="\e[0;32m\033[1m"
red="\e[0;31m\033[1m"
yellow="\e[0;33m\033[1m"
endColour="\033[0m\e[0m"

function currentLocation() {
 echo "Ubicación actual: ${yellow}$(pwd)${endColour}\n"}

function newLocation() {
 echo "\nAhora se encuentra en: ${green}$(pwd)${endColour}"
}

function back() { 
 echo "${blue}
 ██╗     ███████╗██╗   ██╗███████╗██╗     ███████╗
 ██║     ██╔════╝██║   ██║██╔════╝██║     ██╔════╝
 ██║     █████╗  ██║   ██║█████╗  ██║     ███████╗
 ██║     ██╔══╝  ╚██╗ ██╔╝██╔══╝  ██║     ╚════██║
 ███████╗███████╗ ╚████╔╝ ███████╗███████╗███████║
 ╚══════╝╚══════╝  ╚═══╝  ╚══════╝╚══════╝╚══════╝
 ${endColour}"
 
 currentLocation
 msg="¿Cuántos niveles desea retroceder? ▸ "
 echo -ne ${msg}
 read msg
 resp=$(echo $msg | tr -dc '0-9')
 
 if [ "$resp" = "0" ]; then
  echo "\n${red}error${endColour}"
 else 
  for i in {1..${resp}}; do
   level="../"
   result+=${level}
  done
  cd $result
  newLocation
  unset result
 fi
}

clear
tput civis
back
