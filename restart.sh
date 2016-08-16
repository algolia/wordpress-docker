#!/usr/bin/env bash
set -e

rm -Rf ./tmp
mkdir ./tmp
cp -R ./wordpress/wp-content/plugins ./tmp/plugins
cp -R ./wordpress/wp-content/themes ./tmp/themes
rm -Rf ./wordpress
mkdir -p ./wordpress/wp-content
mv ./tmp/plugins ./wordpress/wp-content/plugins
mv ./tmp/themes ./wordpress/wp-content/themes

docker-compose stop
docker-compose rm --all --force
docker-compose build
docker-compose up
