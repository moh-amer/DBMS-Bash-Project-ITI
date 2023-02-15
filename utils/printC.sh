#!/bin/bash

function print_colored_string {
  string=$1
  color=$2

  case $color in
    red)
	    echo -e "\033[0;31m$string\033[0m"
	    ;;
    green)
	    echo -e "\033[0;32m$string\033[0m"
	    ;;
    yellow)
	    echo -e "\033[0;33m$string\033[0m"
	    ;;
    blue) 
	    echo -e "\033[0;34m$string\033[0m"
	    ;;
    orange)
	    echo -e "\033[38;5;208m$string\033[0m"
	    ;;
    *) echo $string;;
  esac
}


