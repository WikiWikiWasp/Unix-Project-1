#!/bin/bash
# Mark McDermott
# Jason Flinn
# Carlo Rodriguez
# Benjamin Winston

# Defining Find() function
Find() {
    if [ "$#" -eq 0 ]; then
	read -p "Please enter a name, address, phone number, or e-mail: " reply
    else
	reply="$1"
    fi

    echo
    
    if ! grep -q "$reply" database.txt; then
	echo "Record not found."
	echo
	return 1
    fi

    if [ "$reply" = ":" ]; then
	echo "Record not found."
	echo
	return 1
    fi

    if [ -z "$reply" ]; then
	echo "Record not found."
	echo  
	return 1
    fi 

    iconv -l | grep "$reply" database.txt | head -5 | tr ':' ' '

    echo
}
# Defining Add() function
Add() {
  printf "\nadd new record stub\n\n"
}
# Defining Update() function
Update() {
  printf "\nupdate record stub\n\n"
}
# Defining Remove() function
Remove() {
  printf "\nremove record stub\n\n"
}
# Defining Display() function
Display() {
  printf "\ndisplay record stub\n\n"
}
# Defining Quit() function
Quit() {
  printf "\nquit stub\n\n"
}
# Main script

printf "Welcome to my contact database, please select in the following menu:\n\n"

while [ SELECTION != "e" ]
do
  printf "(a) Find a record\n"
  printf "(b) Add a new record\n"
  printf "(c) Update a record\n"
  printf "(d) Remove a record\n"
  printf "(e) Quit\n\n"
  printf "Selection is: "

  read SELECTION

  case "$SELECTION" in
    "a")  Find ;;
    "b")  Add ;;
    "c")  Update ;;
    "d")  Remove ;;
    "e")  printf "\nThank you for using Contact Manager.  Goodbye.\n\n"
          break ;;
    *)    printf "\nInvalid entry. Please try again.\n\n"
  esac

done
