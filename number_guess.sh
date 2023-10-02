#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

random=$(( $RANDOM % 10 + 1  ))
user_input=""
guess_input=""
re='^[0-9]+$'
counter=""

echo "Enter your username:"
read input
user_input=$input


USERNAME_ID="$($PSQL "SELECT username_id FROM usernames WHERE name='$user_input'")"


GUESS() {
while [[ $guess_input -ne $random ]] 
do
if [[ $guess_input -gt $random ]];                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
  then 
    echo "It's lower than that, guess again:"
    read input
    guess_input=$input
    counter=$(( $counter + 1 ))
    GUESSED
    #CHECKINT
  else
    echo "It's higher than that, guess again:"
    read input
    guess_input=$input
    counter=$(( $counter + 1 ))
    GUESSED
    #CHECKINT
fi
done
}


GUESSING() {
  echo -e "\nGuess the secret number between 1 and 1000:"
  read guessinput
  guess_input=$guessinput
  counter=$(( $counter + 1 ))
  GUESSED
  #CHECKINT
  GUESS
}

CHECKINT() {
  while [[ ! "$guess_input" =~ ^[0-9]+$  ]]
  do
    echo "That is not an integer, guess again:"
    read inp
    guess_input=$inp
    counter=$(( $counter + 1 ))
    GUESSED
  done
}

GUESSED() {
  if [[ $guess_input -eq $random ]]; then
    echo "You guessed it in $counter tries. The secret number was $random. Nice job!"
    GETID="$($PSQL "SELECT username_id FROM usernames WHERE name='$user_input'")"
    MAXGAMEID="$($PSQL "SELECT MAX(game_id) FROM games_played WHERE username_id=$GETID ")"
    #INSERT_GUESSED="$($PSQL "INSERT INTO games_played(guess) SELECT MAX(games_played.game_id) FROM games_played WHERE game_id=$MAXGAMEID")"
    INSERT_GUESSED="$($PSQL "UPDATE games_played SET guess=$counter WHERE game_id=$MAXGAMEID")"
    exit 0
  else
    CHECKINT
  fi
}



if [[ -z $USERNAME_ID ]]; then
  INSERTUSER="$($PSQL "INSERT INTO usernames(name) VALUES('$user_input')")"
  GETID="$($PSQL "SELECT username_id FROM usernames WHERE name='$user_input'")"
  INSERTGAME="$($PSQL "INSERT INTO games_played(username_id) VALUES($GETID)  ")"
  echo "Welcome, $user_input! It looks like this is your first time here."
  GUESSING
else
  gamesplayed="$($PSQL "SELECT COUNT(username_id) FROM games_played WHERE username_id=$USERNAME_ID")"
  BESTGAME="$($PSQL "SELECT MIN(guess) FROM games_played WHERE username_id=$USERNAME_ID")"
  echo "Welcome back, $user_input! You have played $gamesplayed games, and your best game took $BESTGAME guesses."
  
  GUESSING
fi