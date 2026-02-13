#! /bin/bash
PSQL="psql --username=freecodecamp --dbname=salon --tuples-only -c"

SHOW_SERVICES(){
  SERVICES_LIST=$($PSQL "SELECT service_id, name FROM services")
  echo "$SERVICES_LIST" | while read SERVICE_ID BAR SERVICE
  do
    echo "$SERVICE_ID) $SERVICE"
  done
}
MAIN(){
  if [[ $1 ]]
  then
    echo -e "$1"
  fi
  SHOW_SERVICES
  read SERVICE_ID_SELECTED
  SERVICE_NAME=$($PSQL "SELECT name FROM services WHERE service_id=$SERVICE_ID_SELECTED")
  while [[ ( !$SERVICE_ID_SELECTED =~ ^[0-9]+$) || (-z $SERVICE_NAME) ]]
  do
    SHOW_SERVICES
    read SERVICE_ID_SELECTED
    SERVICE_NAME=$($PSQL"SELECT name FROM services WHERE service_id=$SERVICE_ID_SELECTED")
  done

  echo -e "\nPhone number?"
  read CUSTOMER_PHONE
  CUSTOMER_ID=$($PSQL"SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE'")
  if [[ -z $CUSTOMER_ID ]]
  then
    echo "No phone number, insert your name"
    read CUSTOMER_NAME
    INSERT_CUSTOMER_RESULT=$($PSQL "INSERT INTO customers(name, phone) VALUES('$CUSTOMER_NAME', '$CUSTOMER_PHONE')")
    CUSTOMER_ID=$($PSQL"SELECT customer_id FROM customers WHERE name='$CUSTOMER_NAME'")
  else
    CUSTOMER_NAME=$($PSQL"SELECT name FROM customers WHERE phone='$CUSTOMER_PHONE'")
  fi
  echo -e "\nInsert time"
  read SERVICE_TIME
  INSERT_APPOINTMENT=$($PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES($CUSTOMER_ID, $SERVICE_ID_SELECTED, '$SERVICE_TIME')")
  echo -e "\nI have put you down for a$SERVICE_NAME at $SERVICE_TIME, $CUSTOMER_NAME."
}

MAIN