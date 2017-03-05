#!/bin/bash
# Mark McDermott
# Jason Flinn
# Carlo Rodriguez
# Benjamin Winston

#Parameters
database=database.txt

# Defining Find() function
Find() {
    if [ "$#" -eq 0 ]; then
	read -p "Please enter a name, address, phone number, or e-mail: " reply
    else
	reply="$1"
    fi

    echo
    
    if ! grep -q "$reply" $database; then
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

    iconv -l | grep "$reply" $database | head -5 | tr ':' ' '

    echo
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
