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
    #User prompts and inputs
    read  -p "Please enter contact Name: " CONNAME
    #check if input < 1
    while [ ${#CONNAME} -lt 1 ]
    do 
        read -p "No input submitted, Please enter contact name again: " CONNAME
        #keep looping until they enter a value
    done
    read -p "Please enter contact Address: " CONADD
    #check if input < 1
    while [ ${#CONADD} -lt 1 ]
    do 
        read -p "No input submitted, Please enter contact address again: " CONADD
        #keep looping until they enter a value
    done
    read -p "Please enter contact Phone Number (XXXXXXX): " CONADD
    #check if input < 1
    while [ ${#CONPHONE} -lt 1 ]
    do 
        read -p "No input submitted, Please enter contact phone number again: " CONPHONE
        #keep looping until they enter a value
    done
    while [ ${#CONPHONE} -gt 7 ]
    do
        read -p "Too many digits entered, please enter contact phone number again with 7 digits in the format XXXXXXX: " CONPHONE
    done
    read -p "Please enter contact Email: " CONEMAIL
    #check if input < 1
    while [ ${#CONEMAIL} -lt 1 ]
    do 
        read -p "No input submitted, Please enter contact email again: " CONEMAIL
        #keep looping until they enter a value
    done

    #check if input > 0
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
