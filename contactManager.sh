#!/bin/bash
# Mark McDermott
# Jason Flinn
# Carlo Rodriguez
# Benjamin Winston

# Defining Find() function
Find() {
  echo "find stub"
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
    "q")  echo "Quit"
          exit
          ;;
     * )  echo "Invalid option.  Please try again." ;;
    esac
    sleep 1
done
