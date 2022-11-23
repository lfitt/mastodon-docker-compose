#!/bin/bash

DB_POOL=16

bundle exec sidekiq -q "default" -c $DB_POOL &

bundle exec sidekiq -q "ingress" -c $DB_POOL &
bundle exec sidekiq -q "mailers" -c $DB_POOL &
bundle exec sidekiq -q "push" -c $DB_POOL &
bundle exec sidekiq -q "pull" -c $DB_POOL &
bundle exec sidekiq -q "scheduler" -c $DB_POOL 

