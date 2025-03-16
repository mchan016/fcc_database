#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"

# Display message if no arguments
if [[ -z $1 ]]
then
  echo "Please provide an element as an argument."
else
  SELECT_PORTION="SELECT atomic_number, symbol, name, atomic_mass, melting_point_celsius, boiling_point_celsius, type FROM elements INNER JOIN properties USING(atomic_number) LEFT JOIN types USING(type_id)"

  # Get filter condition
  if [[ $1 =~ ^[0-9]+$ ]]
  then
    CONDITION_PORTION="WHERE atomic_number=$1"
  else
    CONDITION_PORTION="WHERE symbol='$1' OR name='$1'"
  fi

  # Search for element data
  ELEMENT_DATA=$($PSQL "$SELECT_PORTION $CONDITION_PORTION;")
  
  # If element was not found
  if [[ -z $ELEMENT_DATA ]]
  then
    echo "I could not find that element in the database."
  else
    IFS="|" read ATOMIC_NUM SYMBOL NAME MASS MELTING BOILING TYPE <<< $ELEMENT_DATA
    echo "The element with atomic number $ATOMIC_NUM is $NAME ($SYMBOL). It's a $TYPE, with a mass of $MASS amu. $NAME has a melting point of $MELTING celsius and a boiling point of $BOILING celsius."
  fi
fi
