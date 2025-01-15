#!/bin/bash

if [ ! -f ".env.local" ]; then
  echo "Error: .env.local file not found."
  exit 1
fi

bindings=""

while IFS= read -r line || [ -n "$line" ]; do
  if [[ ! "$line" =~ ^# ]] && [[ -n "$line" ]]; then
    IFS='=' read -r name value <<< "$line"
    bindings+="--binding ${name}='${value}' "
  fi
done < .env.local

bindings="${bindings%%[[:space:]]*}"

echo "$bindings"
