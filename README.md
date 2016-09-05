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

rake db:migrate

bundle exec rails server --port=8080