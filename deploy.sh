#!/bin/zsh

vared -p "Enter commit message: " -c message

printf "\e[33m\nBuilding project...\e[39m\n"
cd ..
hugo -D 

printf "\\e[33m\nPushing to YOUR_GITHUB_USERNAME.github.io repository...\e[39m\n\n"
#cd ..
git add .
git commit -m "$message"
git push origin main
printf "\e[32m\nSuccessfully deployed the website!\e[39m"

printf "\e[33m\n\nNow pushing latest changes to PERSONAL_REPOSITORY_NAME repository...\e[39m\n\n"
cd public
git add .
git commit -m "$message"
git fetch origin main
git pull --rebase origin main
git push origin main
printf "\033[0;32m\nSuccessfully pushed changes to the repository!\e[39m\n"
