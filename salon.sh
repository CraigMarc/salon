#! /bin/bash
echo -e "\n~~~~ MY SALON ~~~~\n"
PSQL="psql -X --username=freecodecamp --dbname=salon --no-align --tuples-only -c"

MAIN_MENU() {
  echo -e "\nWelcome to My Salon, how can I help you?\n"
   echo -e "\n1) hair cut\n2) pedicure\n3) manicure"
  read SERVICE_ID_SELECTED
   case $SERVICE_ID_SELECTED in
    1)  ;;
    2)  ;;
    3)  ;;
    *) MAIN_MENU "Please enter a valid option." ;;
  esac
}
MAIN_MENU
  echo -e "\nWhat's your phone number?"
  read CUSTOMER_PHONE
  CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone = '$CUSTOMER_PHONE'")
  # if customer doesn't exist
        if [[ -z $CUSTOMER_NAME ]]
        then
          # get new customer name
          echo -e "\nWhat's your name?"
          read CUSTOMER_NAME

          # insert new customer
          INSERT_CUSTOMER_RESULT=$($PSQL "INSERT INTO customers(phone, name) VALUES('$CUSTOMER_PHONE', '$CUSTOMER_NAME')") 
        fi
        SERVICE=$($PSQL "SELECT name FROM services WHERE service_id = $SERVICE_ID_SELECTED")
     echo -e "\nWhat time would you like your $SERVICE, $CUSTOMER_NAME"
     read SERVICE_TIME
