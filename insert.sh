#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.

function INSERT_TEAM() {
  TEAM_NAME="$1"
  #echo " -  Now looking for team : $TEAM_NAME"
  TEAM_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$TEAM_NAME'")
  if [[ -z $TEAM_ID ]]
  then
    INSERT_TEAM_RESULT=$($PSQL "INSERT INTO teams(name) VALUES('$TEAM_NAME')")
    if [[ $INSERT_TEAM_RESULT == "INSERT 0 1" ]]
    then
      echo " + Inserted into teams, $TEAM_NAME"
    fi
    TEAM_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$TEAM_NAME'")
  else
    echo " = Team found --> $TEAM_ID"
  fi
  return $TEAM_ID
}

function INSERT_GAME() {
  GAME_YEAR=$1
  GAME_ROUND="$2" 
  GAME_WINNER=$3
  GAME_OPPONENT=$4
  GAME_WINNER_GOALS=$5 
  GAME_OPPONENT_GOALS=$6
  INSERT_GAME_RESULT=$($PSQL "INSERT INTO games(year,round,winner_id,opponent_id,winner_goals,opponent_goals) VALUES($GAME_YEAR,'$GAME_ROUND',$GAME_WINNER,$GAME_OPPONENT,$GAME_WINNER_GOALS,$GAME_OPPONENT_GOALS)")
  if [[ $INSERT_GAME_RESULT == "INSERT 0 1" ]]
  then
    echo " + Inserted into games, $GAME_YEAR"
  fi
}

function TRUNCATE_TABLES() {
  echo $($PSQL "TRUNCATE games,teams;")
}

TRUNCATE_TABLES
cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS
do
  if [[ $YEAR != year ]]
  then
    if [[ $ROUND != "" ]]
    then
      echo "Data --> year : $YEAR, round : $ROUND, winner : $WINNER, opponent : $OPPONENT, win.goals : $WINNER_GOALS, opp.goals : $OPPONENT_GOALS"
      #echo ". Getting data for winning team : $WINNER"
      INSERT_TEAM "$WINNER"
      TEAM_ID_WINNER=$TEAM_ID
      #echo ". Getting data for opposing team : $OPPONENT"
      INSERT_TEAM "$OPPONENT"
      TEAM_ID_OPPONENT=$TEAM_ID
      echo "Winner : $TEAM_ID_WINNER, Oppnent : $TEAM_ID_OPPONENT"
      INSERT_GAME $YEAR "$ROUND" $TEAM_ID_WINNER $TEAM_ID_OPPONENT $WINNER_GOALS $OPPONENT_GOALS
      echo "-------------------------------------------------------------------"
    else
      echo "Not adding line as it's the header of the CSV file."
      echo "-------------------------------------------------------------------"
    fi
  else
    echo "Not adding line as it seems to be empty."
    echo "-------------------------------------------------------------------"
  fi
done
