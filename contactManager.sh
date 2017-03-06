#!/bin/bash
# Mark McDermott
# Jason Flinn
# Carlo Rodriguez
# Benjamin Winston

#Parameters
database=database.txt
dbTemp=dbtemp.txt	#db temp file

# Defining Find() function
Find() {
     if ! [ -f $database ]	
     then
       printf "No database present.  Please populate the database before selecting this option.\n"
       printf "Returning to main menu.\n"
       return 1
    fi
    
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

    iconv -l | grep "$reply" $database | head | tr ':' ' '

    echo
}
# Defining Add() function
Add() {
    #database=database.txt

    #User prompts and inputs
    #CONTACT NAME
    read -p "Please enter contact Name: " CONNAME
    #check for no input
    while [ ${#CONNAME} -lt 1 ]
    do 
        read -p "No input submitted, Please enter contact name again: " CONNAME
    done
    #output
    printf "${CONNAME}:" >> $database

    #CONTACT ADDRESS
    read -p "Please enter contact Address: " CONADD
    #check for no input
    while [ ${#CONADD} -lt 1 ]
    do 
        read -p "No input submitted, Please enter contact address again: " CONADD
    done
    #output
    printf "${CONADD}:" >> $database

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
    printf "${CONPHONE}:" >> $database

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
   if ! [ -f $database ]	
   then
      printf "No database present.  Please populate the database before selecting this option.\n"
      printf "Returning to main menu.\n"
      return 1
   fi
  
  menuTitle="Update Record Menu"
  optionA="Search for record to update"
  optionB="Select from all records"

  while [ CHOICE != "m" ]
  do
    printf "\n     %s\n\n" "$menuTitle"
    printf "(a) %s\n" "$optionA"
    printf "(b) %s\n" "$optionB"
    printf "(m) Return to main menu\n\n"
    printf "Please make a selection: "

    read CHOICE

    case "$CHOICE" in 
      "a") #printf "\nSearch for record stub\n" ;;
         read -p "Please enter a search string: " CHOICE
         while [ -z $CHOICE ]
         do
              read -p "No string entered, please enter a search string: " CHOICE
         done
	 grep -n $CHOICE $database 
         if [ $? -eq 0 ]
         then
              printf "Which record number would you like to update?\n"
              read -p "or enter r to return to Update Record menu: " CHOICE
              if [ $CHOICE == "r" ]
              then
                printf "Returning to %s\n" "$menuTitle"
              else
                head -n `expr $CHOICE - 1` $database > $dbTemp
                tail -n +`expr $CHOICE + 1` $database >> $dbTemp
                #cp $database db_backup.txt
                mv $dbTemp $database
                printf "Please update record:\n"
		Add
              fi
         else
           printf "Search string not found in database\n"
           printf "Returning to %s\n" "$menuTitle"
         fi ;;                
      "b") #printf "\nSelect from all records stub\n" ;;
         cat -n $database 
         printf "Please select the record number you would like to update\n"
         read -p "or enter r to return to Update Record Menu: " CHOICE
         if [ $CHOICE == "r" ]
         then
            printf "Returning to %s\n" "$menuTitle"
         else
            while [ -z $CHOICE ]
            do 
              read -p "No record number entered, please enter a record number: " CHOICE
            done
         head -n `expr $CHOICE - 1` $database > $dbTemp
         tail -n +`expr $CHOICE + 1` $database >> $dbTemp
         mv $dbTemp $database
         printf "Please update record:\n"
	 Add
         fi ;;
      "m") return 0 ;;
      *)   printf "\nInvalid selection, please try again.\n\n"
    esac
  done
  #printf "\nupdate record stub\n\n"
}
# Defining Remove() function
Remove() {
   if ! [ -f $database ]	
   then
      printf "No database present.  Please populate the database before selecting this option.\n"
      printf "Returning to main menu.\n"
      return 1
   fi
  
  menuTitle="Remove Record Menu"
  optionA="Search for record to remove"
  optionB="Select from all records"
  
  while [ CHOICE != "m" ]
  do
    printf "\n     %s\n\n" "$menuTitle"
    printf "(a) %s\n" "$optionA"
    printf "(b) %s\n" "$optionB"
    printf "(m) Return to main menu\n\n"
    printf "Please make a selection: "

    read CHOICE

    case "$CHOICE" in 
      "a") #printf "\nSearch for record stub\n" ;;
         read -p "Please enter a search string: " CHOICE
         while [ -z $CHOICE ]
         do
              read -p "No string entered, please enter a search string: " CHOICE
         done
	 grep -n $CHOICE $database 
         if [ $? -eq 0 ]
         then
              printf "Which record number would you like to delete?\n"
              read -p "or enter r to return to Remove Record menu: " CHOICE
              if [ $CHOICE == "r" ]
              then
                printf "Returning to %s\n" "$menuTitle"
              else
                head -n `expr $CHOICE - 1` $database > $dbTemp
                tail -n +`expr $CHOICE + 1` $database >> $dbTemp
                #cp $database db_backup.txt
                mv $dbTemp $database
              fi
         else
           printf "Search string not found in database\n"
           printf "Returning to %s\n" "$menuTitle"
         fi ;;                
      "b") #printf "\nSelect from all records stub\n" ;;
         cat -n $database 
         printf "Please select the record number you would like to remove\n"
         read -p "or enter r to return to Remove Record Menu: " CHOICE
         if [ $CHOICE == "r" ]
         then
            printf "Returning to %s\n" "$menuTitle"
         else
            while [ -z $CHOICE ]
            do 
              read -p "No record number entered, please enter a record number: " CHOICE
            done
            head -n `expr $CHOICE - 1` $database > $dbTemp
            tail -n +`expr $CHOICE + 1` $database >> $dbTemp
            mv $dbTemp $database
         fi ;;
      "m") return 0 ;;
      *)   printf "\nInvalid selection, please try again.\n\n"
    esac
  done
  #printf "\nremove record stub\n\n"
}
# Defining Display() function
Display() {
  if ! [ -f $database ]	
  then
      printf "No database present.  Please populate the database before selecting this option.\n"
      printf "Returning to main menu.\n"
      return 1
  fi
  
  numRecords=`cat $database | wc -l`
  numRecords=`expr $numRecords - 1`	#For the first header line of db
  printf "\n     Showing all records:\n"
  cat -n $database
  printf "\n     Total Records: %s\n" "$numRecords"
}
# Defining Quit() function
Quit() {
  printf "\nThank you for using Contact Manager.  Goodbye.\n\n"
  exit 0
  #printf "\nquit stub\n\n"
}
# Main script

printf "Welcome to my contact database, please select in the following menu:\n\n"

while [ SELECTION != "q" ]
do
  printf "(a) Find a record\n"
  printf "(b) Add a new record\n"
  printf "(c) Update a record\n"
  printf "(d) Remove a record\n"
  printf "(e) Display all records\n"
  printf "(q) Quit\n\n"
  printf "Selection is: "

  read SELECTION

  case "$SELECTION" in
    "a")  Find ;;
    "b")  Add ;;
    "c")  Update ;;
    "d")  Remove ;;
    "e")  Display ;;
    "q")  Quit ;;
    *)    printf "\nInvalid entry. Please try again.\n\n"
  esac

done
