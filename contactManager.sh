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
    #echo "add stub"
    #User prompts and inputs
    echo "Please enter contact Name: "
    read $CONNAME
    #check if input < 1
    if [ ${#CONNAME} -lt 1 ]
    then
        do 
            echo "No input submitted, Please enter contact name again: "
            read $CONNAME
            #keep looping until they enter a value
            if [ ${#CONNAME} -lt 1 ]
            then
                continue
            else
                break
            fi
        done
    fi
    echo "Please enter contact Address: "
    read $CONADD
    #check if input < 1
    if [ ${#CONADD} -lt 1 ]
    then
        do 
            echo "No input submitted, Please enter contact address again: "
            read $CONADD
            #keep looping until they enter a value
            if [ ${#CONADD} -lt 1 ]
            then
                continue
            else
                break
            fi
        done
    fi
    echo "Please enter contact Phone Number (XXXXXXX): "
    read $CONPHONE
    #check if input < 1
    if [ ${#CONPHONE} -lt 1 ]
    then
        do 
            echo "No input submitted, Please enter contact phone number again: "
            read $CONPHONEE
            #keep looping until they enter a value
            if [ ${#CONPHONE} -lt 1 ]
            then
                continue
            else
                break
            fi
        done
    fi
    if [ ${#CONPHONE} -gt 7 ]
    then
        do
            echo "Too many digits entered, please enter contact phone number again with 7 digits in the format XXXXXXX: "
            read $CONPHONE
            if [ ${#CONPHONE} -gt 7 ]
            then
                continue
            else
                break
            fi
        done
    fi
    echo "Please enter contact Email: "
    read $CONEMAIL
    #check if input < 1
    if [ ${#CONEMAIL} -lt 1 ]
    then
        do 
            echo "No input submitted, Please enter contact email again: "
            read $CONEMAIL
            #keep looping until they enter a value
            if [ ${#CONEMAIL} -lt 1 ]
            then
                continue
            else
                break
            fi
        done
    fi

    #check if input > 0
    if []
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
