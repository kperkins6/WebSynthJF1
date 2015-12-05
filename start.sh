#!/bin/bash/
echo "==============================================================="
echo "Installing all Gem Files"
echo "==============================================================="
echo "..."
bundle install
echo "Done"
echo "==============================================================="
echo "Raking Routes"
echo "==============================================================="
echo "..."
rake routes
echo "Done"
echo "==============================================================="
echo "Dropping old Database so we can start fresh"
echo "==============================================================="
echo "..."
rake db:drop
echo "Done"
echo "==============================================================="
echo "Running updated migrations in case changes have been made"
echo "==============================================================="
echo "..."
rake db:migrate
echo "Done"
echo "==============================================================="
echo "Setting database to production. "
echo "==============================================================="
echo "..."
RAILS_ENV=production rake db:drop
RAILS_ENV=production rake db:migrate
RAILS_ENV=production rake assets:precompile
RAILS_ENV=production rake db:seed
echo "Done"
echo "==============================================================="
echo "Seeding the database"
echo "==============================================================="
echo "..."
rake db:seed
echo "Done"
echo "==============================================================="
echo "Starting up the server"
echo "==============================================================="
sudo apache2ctl restart
rails s -b 0.0.0.0
