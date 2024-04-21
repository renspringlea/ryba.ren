#!/usr/bin/env bash
bundle exec jekyll build
#cd _site
git pull
git add .
git commit -m "Update"
git push
