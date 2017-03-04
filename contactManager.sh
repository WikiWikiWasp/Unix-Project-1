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
	
    if ! grep -q "$reply" database.txt; then
	echo "Record not found."
	
	return 1
    fi

    if [ "$reply" = ":" ]; then
	echo "Record not found."
	return 1
    fi

    if [ -z "$reply" ]; then
	echo "Record not found."
	echo "$1" 
	return 1
    fi 

    iconv -l | grep "$reply" database.txt | head -5 | tr ':' ' '
}
# Defining Add() function
Add() {
  echo "add stub"
}
# Defining Update() function
Update() {
  echo "update stub"
}
# Defining Remove() function
Remove() {
  echo "remove stub"
}
# Defining Display() function
Display() {
  echo "display stub"
}
# Defining Quit() function
Quit() {
  echo "quit stub"
}
# Main script

while :
do
    clear
    cat<<EOF
    Welcome to Contact Manager.
    Please enter your choice number:
    1: Find a record
    2: Add a record
    3: Update a record
    4: Remove a record
    5: Quit
EOF
    read -n1 -s
    case "$REPLY" in
    "1")  Find ;;
    "2")  Add ;;
    "3")  Update ;;
    "4")  Remove ;;
    "5")  echo "Thank you for using Contact Manager.  Goodbye."
          exit
          ;;
     * )  echo "Invalid option.  Please try again." ;;
    esac
    sleep 1
done
