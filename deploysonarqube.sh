#!/bin/bash

  echo "enter postgres username secret : "
  read postgres_username
  echo "enter postgres password secret : "
  read postgres_password
  if [ -z "$postgres_username" ]
  then  
    echo "setting up default username for postgres which is postgresadmin"
    defaultusername=$(echo -n "postgresadmin" | base64)
    sed -i "s|pugn|$defaultusername|g" postgres-secrets.yml
  else
    Myuser=$(echo -n $postgres_username | base64)
    echo "$Myuser"
    defaultusername=$(echo -n "postgresadmin" | base64)
    sed -i "s|pgun|$Myuser|g" postgres-secrets.yml

  fi
