#!/bin/bash

rm -rf db/development.sqlite3

chmod 777 bin/*
./bin/rake db:migrate RAILS_ENV=development
./bin/rake db:seed