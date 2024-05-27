#!/bin/bash

PROJECT_NAME="dev-fbd-site"
CONFIG_FILE="dev.docker-compose.yml"
UP_OPTIONS="--build"
ENV_FILE="./env/.dev.env"


choose_action() {
  echo -e ""
  echo -e "  1. Up (build and watch)"
  echo -e "  2. Down"
  echo -e "  3. Restart (donw and up)"
  echo -e "  4. Status of Projects, Containers"
  echo -e "  5. Watch\n"
  read -p "Enter your choice: " choice
  echo -e ""

  case $choice in
    1)
      docker compose --project-name $PROJECT_NAME --file $CONFIG_FILE --env-file $ENV_FILE up $UP_OPTIONS
      choose_action
      ;;
    2)
      docker compose --project-name $PROJECT_NAME down
      choose_action
      ;;
    3)
      docker compose --project-name $PROJECT_NAME down
      docker compose --project-name $PROJECT_NAME --file $CONFIG_FILE --env-file $ENV_FILE up $UP_OPTIONS
      choose_action
      ;;
    4)
      docker compose ls --all --filter name=$PROJECT_NAME
      echo -e ""
      docker compose -p $PROJECT_NAME ps --all
      choose_action
      ;;
    5)
      docker compose --project-name $PROJECT_NAME --file $CONFIG_FILE --env-file $ENV_FILE watch
      choose_action
      ;;
    *)
      echo "Invalid choice"
      choose_action
      ;;
  esac
}

choose_action
