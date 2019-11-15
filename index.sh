#!/usr/bin/env bash
set -e

# font color
_NOCOLOR_="\033[0m"
_GREEN_="\033[92m"
_RED_="\033[0;31m"
_YELLOW_="\e[93m"
_RED_BACKGROUND="\e[41m"

# font weight
_BOLD_=$(tput bold)
_NORMAL_=$(tput sgr0)

# text format
_FORMAT_COMMAND_="$_GREEN_%-25s $_NOCOLOR_%0s$_NOCOLOR_ \n"
_FORMAT_OPTION_="$_GREEN_%-8s $_NOCOLOR_%0s$_NOCOLOR_ \n"

error() {
  if [[ $1 != "--help" ]]; then
    printf "$_RED_BACKGROUND Unknown command $_BOLD_$1 $_NOCOLOR_ \n"
  fi
}

title() {
  printf "\n$_YELLOW_$1$_NOCOLOR_ \n"
}

title_bold() {
  printf "\n${_BOLD_}$_YELLOW_$1$_NOCOLOR_ \n"
}

all_commands() {
  title "Available Commands:"
  printf "$_FORMAT_COMMAND_" \
    "start" "Start the dev server" \
    "build" "Build the resource for production" \
    "test" "Start the test scripts"
}

all_options() {
  title "Options:"
  printf "$_FORMAT_OPTION_" \
    "--help" "display the help message"
}

print_usage() {
  title_bold "Usage:"
  echo "bash index.sh [command]"
  all_options
  all_commands
}

case $1 in
star)
  echo 'start executed!'
  ;;
build)
  echo 'build executed!'
  ;;
test)
  echo 'test executed!'
  ;;
*)
  error "$1"
  print_usage
  exit
  ;;
esac
