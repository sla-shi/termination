# Introduction
This web app allows users to quickly create a PDF of the termination letter for the carrier services.
The app is written with Ruby on Rails 4.2.4, React JS, Material Design styles from materializecss.com 
and PDF JS by Mozilla.

# License
Unauthorized copying of this project, via any medium is strictly prohibited.
Proprietary and confidential. 
Written by Viacheslav Shybaiev <slashi@gmail.com> September 2016.

# Installation
##Add to Gemfile
gem 'react-rails', '~> 1.0'

gem 'prawn'

## Install Gems 
bundle install

rails g react:install

gem install prawn

bundle install


* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

# Deployment instructions
## Google Cloud
Create the GCP project in the US Zone and create the app instance. 
With the console command line type:

mkdir src

git clone https://github.com/sla-shi/termination.git

cd termination

bundle install

Update the app.yaml with the secret key from the result of this command:

RAILS_ENV=production rake secret

Example line from the app.yaml:
  SECRET_KEY_BASE: 04cad52dc634d410513bbc85c01a93f028038d33189a0bd411a2ef57d42df8f2d15c46ab00b70a9c21d91fe90cb835abd6b5e3d41f734b4588ee010170274db9

rake db:migrate RAILS_ENV=production

rake assets:precompile

Test the local run:

bundle exec rails server --port=8080

gcloud app deploy
