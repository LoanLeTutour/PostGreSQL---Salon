#! /bin/bash

PSQL="psql -X --username=freecodecamp --dbname=salon --tuples-only -c"
echo -e "\n-- Loan's salon --\n"
echo -e "Welcome to the salon! What are you looking for?\n"
MAIN_MENU() {
  if [[ $1 ]]
  then
  echo -e "\n$1"
  fi
  echo -e "1) cut\n2) trim\n3) wash\n4) brush\n5) exit\n"
  read SERVICE_ID_SELECTED
  case $SERVICE_ID_SELECTED in
  1)CUT_MENU;;
  2)TRIM_MENU;;
  3)WASH_MENU;;
  4)BRUSH_MENU;;
  5)EXIT;;
  *)MAIN_MENU "This service doesn't exist... What would you like?\n";;
  esac
}

CUT_MENU() {
  SERVICE_SELECTED='cut'
  echo -e "\nThis is the $SERVICE_SELECTED menu!"
  echo -e "\nWhat's your phone number?\n"
  read CUSTOMER_PHONE
  CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone = '$CUSTOMER_PHONE'")
  if [[ -z $CUSTOMER_NAME ]]
  then 
  echo -e "\nYou are a new client! What's your name?\n"
  read CUSTOMER_NAME
  INSERT_NEW_CUSTOMER=$($PSQL "INSERT INTO customers(phone,name) VALUES('$CUSTOMER_PHONE','$CUSTOMER_NAME')")
  fi
  CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE'")
  echo -e "\nWhat time would you like your $SERVICE_SELECTED, $CUSTOMER_NAME?\n"
  read SERVICE_TIME
  INSERT_NEW_APPOINTMENT=$($PSQL "INSERT INTO appointments(customer_id, service_id,time) VALUES('$CUSTOMER_ID','$SERVICE_ID_SELECTED','$SERVICE_TIME')")
  echo -e "\nI have put you down for a $SERVICE_SELECTED at $SERVICE_TIME, $CUSTOMER_NAME."
}
TRIM_MENU() {
  SERVICE_SELECTED='trim'
    echo -e "\nThis is the $SERVICE_SELECTED menu!"
  echo -e "\nWhat's your phone number?\n"
  read CUSTOMER_PHONE
  CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE'")
  if [[ -z $CUSTOMER_ID ]]
  then 
  echo -e "\nYou are a new client! What's your name?\n"
  read CUSTOMER_NAME
  INSERT_NEW_CUSTOMER=$($PSQL "INSERT INTO customers(phone,name) VALUES('$CUSTOMER_PHONE','$CUSTOMER_NAME')")
  fi
  CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE'")
  CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone='$CUSTOMER_PHONE'")
  echo -e "\nWhat time would you like your $SERVICE_SELECTED, $CUSTOMER_NAME?\n"
  read SERVICE_TIME
  INSERT_NEW_APPOINTMENT=$($PSQL "INSERT INTO appointments(customer_id, service_id,time) VALUES('$CUSTOMER_ID','$SERVICE_ID_SELECTED','$SERVICE_TIME'")
  echo -e "\nI have put you down for a $SERVICE_SELECTED at $SERVICE_TIME, $CUSTOMER_NAME."

}
WASH_MENU() {
  SERVICE_SELECTED='wash'
  echo -e "\nThis is the $SERVICE_SELECTED menu!"
  echo -e "\nWhat's your phone number?\n"
  read CUSTOMER_PHONE
  CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE'")
  if [[ -z $CUSTOMER_ID ]]
  then 
  echo -e "\nYou are a new client! What's your name?\n"
  read CUSTOMER_NAME
  INSERT_NEW_CUSTOMER=$($PSQL "INSERT INTO customers(phone,name) VALUES('$CUSTOMER_PHONE','$CUSTOMER_NAME')")
  fi
  CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE'")
  CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone='$CUSTOMER_PHONE'")
  echo -e "\nWhat time would you like your $SERVICE_SELECTED, $CUSTOMER_NAME?\n"
  read SERVICE_TIME
  INSERT_NEW_APPOINTMENT=$($PSQL "INSERT INTO appointments(customer_id, service_id,time) VALUES('$CUSTOMER_ID','$SERVICE_ID_SELECTED','$SERVICE_TIME'")
  echo -e "\nI have put you down for a $SERVICE_SELECTED at $SERVICE_TIME, $CUSTOMER_NAME."
}
BRUSH_MENU() {
  SERVICE_SELECTED='brush'
  echo -e "\nThis is the $SERVICE_SELECTED menu!"
  echo -e "\nWhat's your phone number?\n"
  read CUSTOMER_PHONE
  CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE'")
  if [[ -z $CUSTOMER_ID ]]
  then 
  echo -e "\nYou are a new client! What's your name?\n"
  read CUSTOMER_NAME
  INSERT_NEW_CUSTOMER=$($PSQL "INSERT INTO customers(phone,name) VALUES('$CUSTOMER_PHONE','$CUSTOMER_NAME')")
  fi
  CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE'")
  CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone='$CUSTOMER_PHONE'")
  echo -e "\nWhat time would you like your '$SERVICE_SELECTED', '$CUSTOMER_NAME'?\n"
  read SERVICE_TIME
  INSERT_NEW_APPOINTMENT=$($PSQL "INSERT INTO appointments(customer_id, service_id,time) VALUES('$CUSTOMER_ID','$SERVICE_ID_SELECTED','$SERVICE_TIME'")
  echo -e "\nI have put you down for a $SERVICE_SELECTED at $SERVICE_TIME, $CUSTOMER_NAME."
}
EXIT() {
  echo -e "\nSee you next time!"
}

MAIN_MENU