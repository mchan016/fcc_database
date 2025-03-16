#!/bin/bash

# Number Guessing Game

PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

# Prompt for user name
echo "Enter your username:"
read USER_NAME

# Query user data
USER_DATA=$($PSQL "SELECT user_id, games_played, best_game FROM users WHERE username='$USER_NAME';")

# Add user if haven't played before otherwise greet them
if [[ -z $USER_DATA ]]
then
  # Add new user
  ADD_USER_RESULT=$($PSQL "INSERT INTO users(username) VALUES('$USER_NAME');")
  USER_DATA=$($PSQL "SELECT user_id, games_played, best_game FROM users WHERE username='$USER_NAME';")
  IFS="|" read USER_ID GAMES_PLAYED BEST_GAME <<< $USER_DATA;
  echo "Welcome, $USER_NAME! It looks like this is your first time here."
else
  # Greet old user and display their stats
  IFS="|" read USER_ID GAMES_PLAYED BEST_GAME <<< $USER_DATA;
  echo "Welcome back, $USER_NAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
fi

# Generate Random number
RANDOM_NUMBER=$((1 + $RANDOM % 1000))
# TODO: Take this out after finish
echo $RANDOM_NUMBER

# Let user start guessing random number
TRIES=1
echo "Guess the secret number between 1 and 1000:"
read USER_GUESS

# Start the game
while :
do
  if [[ ! $USER_GUESS =~ ^[0-9]+$ ]]
  then
    echo "That is not an integer, guess again:"
    read USER_GUESS
    continue
  fi

  # Game loop to let user guess
  if [[ $USER_GUESS == $RANDOM_NUMBER ]]
  then
    echo "You guessed it in $TRIES tries. The secret number was $RANDOM_NUMBER. Nice job!"
    break
  elif [[ $USER_GUESS -lt $RANDOM_NUMBER ]]
  then
    ((++TRIES))
    echo "It's higher than that, guess again:"
    read USER_GUESS
    continue
  else
    ((++TRIES))
    echo "It's lower than that, guess again:"
    read USER_GUESS
  fi
done

# Save user game data
((++GAMES_PLAYED))
if [[ -z $BEST_GAME || $TRIES -lt $BEST_GAME ]]
then
  UPDATE_BEST_GAME=", best_game=$TRIES"
else
  UPDATE_BEST_GAME=""
fi
UPDATE_GAME_RESULTS=$($PSQL "UPDATE users SET games_played=$GAMES_PLAYED $UPDATE_BEST_GAME WHERE user_id=$USER_ID;")