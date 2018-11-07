#!/bin/bash
chmod 777 bin/*
./bin/rake db:migrate RAILS_ENV=development
./bin/rake db:seed