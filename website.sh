#!/usr/bin/env bash
cd ~/Documents/Websites/island
#bundle lock --add-platform x86_64-linux
#bundle exec jekyll build --verbose
#git pull
git add .
git commit -m "Update"
git push
