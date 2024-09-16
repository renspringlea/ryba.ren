#!/usr/bin/env bash
bundle lock --add-platform x86_64-linux
bundle exec jekyll build --verbose
#cd _site
git pull
git add .
git commit -m "Update"
git push
