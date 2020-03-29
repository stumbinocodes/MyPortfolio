#!/bin/bash
# shellcheck disable=SC2120

### This script will rename your angular project. ~matsta25

set -o nounset
set -o errexit

old_app_name="angular-starter-app"
new_app_name=$1

has_not_arg() {
  echo "No your-app-name supplied. Usage eg.:" &&
    echo &&
    echo "./cleanup.sh your-app-name" &&
    echo &&
    exit 1
}

has_arg() {
  echo "Finding and replacing strings from $old_app_name to $new_app_name..." &&
    find ./ -not -path "./node_modules/*" -type f -exec sed -i "s/$old_app_name/$new_app_name/g" {} + &&
    echo "Overwriting README.md file..." && echo "# $new_app_name" >README.md &&
    echo "Removing docs directory..." && rm -rf ./docs &&
    echo "Removing .gitlab-ci.yml..." && rm .gitlab-ci.yml &&
    echo "Removing .travis.yml..." && rm .travis.yml &&
    echo &&
    echo "Project successfully cleaned from $old_app_name to $new_app_name." &&
    echo &&
    exit 0
}

if [ "$#" -eq "0" ]; then
  has_not_arg
else
  has_arg
fi
