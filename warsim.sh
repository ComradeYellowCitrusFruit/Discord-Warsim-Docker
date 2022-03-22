#!/bin/sh

if [ -z "$token" ]; then
    printf "\nNo token specified! A token is needed for the program to work.\n"
    exit 1
else
    printf "\nToken present as expected.\n"
fi
printf "Writting token file...\n"
printf "%s" "$token" > tokenfile
printf "Written!\n"

py=$(eval "python")
printf "%s\n" "$py"

sql=$(eval "sqlite3")
printf "%s\n" "$sql"

node=$(eval "node -v")
printf "%s\n" "$node"

npm=$(eval "npm -v")
printf "%s\n" "$npm"

pm2=$(eval "pm2 ping")
printf "%s\n" "$pm2"

printf "Launching Warsim\n"
eval "pm2 start index.js"
