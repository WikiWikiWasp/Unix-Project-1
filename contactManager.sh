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
    database=database.txt

    #User prompts and inputs
    #CONTACT NAME
    read -p "Please enter contact Name: " CONNAME
    #check for no input
    while [ ${#CONNAME} -lt 1 ]
    do 
        read -p "No input submitted, Please enter contact name again: " CONNAME
    done
    #output
    echo -n "${CONNAME}:" >> $database

    #CONTACT ADDRESS
    read -p "Please enter contact Address: " CONADD
    #check for no input
    while [ ${#CONADD} -lt 1 ]
    do 
        read -p "No input submitted, Please enter contact address again: " CONADD
    done
    #output
    echo -n "${CONADD}:" >> $database

    #CONTACT PHONE NUMBER
    read -p "Please enter contact Phone Number (XXXXXXX): " CONPHONE
    #check for no input
    while [ ${#CONPHONE} -lt 1 ]
    do 
        read -p "No input submitted, Please enter contact phone number again: " CONPHONE
    done
    #check if phone number is > 7
    while [ ${#CONPHONE} -gt 7 ]
    do
        read -p "Too many digits entered, please enter contact phone number again with 7 digits in the format XXXXXXX: " CONPHONE
    done
    #output
    echo -n "${CONPHONE}:" >> $database

    #CONTACT EMAIL
    read -p "Please enter contact Email: " CONEMAIL
    #check for no input
    while [ ${#CONEMAIL} -lt 1 ]
    do 
        read -p "No input submitted, Please enter contact email again: " CONEMAIL
    done
    #test for valid email
    while [[ ${CONEMAIL} != *"@"* ]] || [[ ${CONEMAIL} != *".com" ]]
    do
        read -p "Please enter a valid email with an '@' and '.com': " CONEMAIL 
    done
    #search for duplicate entry
    #find(${CONEMAIL})
    #output
    echo "${CONEMAIL}" >> $database
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
