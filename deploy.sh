#!/bin/sh

# if a command fails then the deploy stops
set -e

printf "\033[0;32mDeploying updates to GitHub...\033[0m\n"

# Build the project
hugo

cd public

git config --global user.email "maunguyen.dinh@gmail.com"
git config --global user.name "Mau D. Ng"

git add .

msg="rebuilding site $(date)"
if [ -n "$*" ]; then
    msg="$*"
fi 
git commit -m "$msg"

git push origin master

