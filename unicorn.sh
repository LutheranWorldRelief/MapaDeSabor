#!/bin/bash

if [ ! -d "/tmprails-app" ]
then
  mkdir "/tmp/rails-app"
fi

rails db:migrate
rails assets:precompile

if [ "${RAILS_ENV}" = "development" ]
then
  echo "Starting rails"
  rm -f tmp/pids/server.pid && bundle exec rails s -p 3000 -b '0.0.0.0'
fi

if [ "${RAILS_ENV}" = "production" ]
then
  echo "Starting unicorn"
  rm -f /unicorn/pids/unicorn.pid && unicorn -c config/unicorn.rb -E production
fi
