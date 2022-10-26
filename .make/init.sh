#!/bin/bash

if [ -f .env ]
then
  set -o allexport
  source .env
  set +o allexport
fi

#############################################################
CHAR_RED=`tput setaf 1`
CHAR_GREEN=`tput setaf 2`
CHAR_BOLD=`tput bold`
CHAR_RESET=`tput sgr0`

function title () {
  echo "${CHAR_GREEN}${CHAR_BOLD} $1 ${CHAR_RESET}"
}

function info () {
  echo -n "${CHAR_GREEN} $1 ${CHAR_RESET}"
}

function error () {
  echo "${CHAR_RED} $1 ${CHAR_RESET}"
}

function ok () {
  echo ${CHAR_GREEN}${CHAR_BOLD} ✓ ${CHAR_RESET} $1
}

function check () {
  if [ $? -eq 0 ]; then
      ok
  else
      error Error
  fi
}
#############################################################

function create_dir() {
  mkdir -vp "$1"
  ok "$1"
}

title "Initialize application for local development"

# postgres container volumes
{
  sudo chown $USER:$GROUP "${STORAGE}" -R
  title "Create directories for volumes in ${STORAGE}"
  create_dir "${STORAGE}/mysql/data"
  create_dir "${STORAGE}/mysql/db"
  sudo chown 1001:1001 "${STORAGE}/mysql" -R
  create_dir "${STORAGE}/rabbitmq/data"
  create_dir "${STORAGE}/elasticsearch/data"
  create_dir "${STORAGE}/postgres/data"
  create_dir "${STORAGE}/postgres/db"
  create_dir "${STORAGE}/mongodb/data"
  create_dir "${STORAGE}/etcd/data"
  create_dir "${STORAGE}/portainer/data"
}

title "All done! You can run: make up"
