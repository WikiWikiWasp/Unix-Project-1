#!/bin/bash
# Mark McDermott
# Jason Flinn
# Carlo Rodriguez
# Benjamin Winston

# Defining Find() function
Find() {
  echo "stub"
}
# Defining Add() function
Add() {
  echo "stub"
}
# Defining Update() function
Update() {
  echo "stub"
}
# Defining Remove() function
Remove() {
  echo "stub"
}
# Defining Display() function
Display() {
  echo "stub"
}
# Defining Quit() function
Quit() {
  echo "stub"
}
# Main script

PS3='Welcome to Contact Manager.  Please enter a letter: '
optionlist=("
(a) Find a record
(b) Update a record
(c) Remove a record
(d) Remove a record
(e) Quit")
select option in "${optionlist[@]}"
do
    case $option in
        "a")
            echo "Find a record"
            ;;
        "b")
            echo "Update a record"
            ;;
        "c")
            echo "Remove a record"
            ;;
        "d")
            echo "Quit"
            break
            ;;
        *) echo not a valid option;;
    esac
done
