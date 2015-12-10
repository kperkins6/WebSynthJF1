#!/usr/bin/bash
# This program will generate the basics of a synthesizer and sequencer website.
# The website will have users that have a private and public list of sequencer
# or synth presets. They can share presets with the public (will be displayed on
# the synth or sequencer's show page
# Due to making mistakes all the time, If fatal errors occur, this makes it easy
# restart without pulling out too many hairs
rails new webSynth
cd webSynth

#################################
#### Update Gem File ############
#################################
  #Add gems to Gemfile
  echo "################################" >> Gemfile
  echo "## Custom Gems Below ###########" >> Gemfile
  echo "################################" >> Gemfile
  echo "gem 'devise'" >> Gemfile
  echo "gem 'quiet_assets', group: :development" >> Gemfile
  echo "gem 'better_errors', group: :development" >> Gemfile
  echo "gem 'binding_of_caller', group: :development" >> Gemfile
  # echo "gem 'ember-rails'" >> Gemfile
  # echo "gem 'ember-source', '~> 1.9.0'" >> Gemfile
  echo "################################" >> Gemfile
  echo "## Custom Gems End #############" >> Gemfile
  echo "################################" >> Gemfile
  #Install all gems
  bundle install
#################################
#### End Gem File Update ########
#################################

#################################
#### Rails Scaffold Generation ##
#################################
  #Generate scaffolds for Article, Profile, Schedule, Checklist
  
  # rails g scaffold Image filename:string private:boolean user_id:integer
  # rails g scaffold Tag str:string image_id:integer
  # rails g scaffold ImageUser image_id:integer user_id:integer

  # generate scaffold for a working Checklist device
  rails g scaffold Checklist name:string user_id:integer
  rails g scaffold Task str:string checklist_id:integer
  
  # generate scaffold for a working schedule device
  rails g scaffold Schedule name:string user_id:integer
  rails g scaffold Event title:string date:datetime location:string eventType:string schedule_id:integer

  # generate scaffold for a working article sharing device
  rails g scaffold Article name:string url:string user_id:integer
  rails g scaffold Tags str:string article_id:integer
  rails g scaffold ArticleUser article_id:integer user_id:integer
  
  # generate scaffold for profile page
  rails g controller Profile index
  rails g controller Welcome index
  rails g controller Privacy index
  rails g controller Terms index

  #generate views for devise user
  rails generate devise:install
  rails generate devise user name:string user_id:integer avatar_url:string #soundcloud_user_id:integer:index
  rails generate devise:views
  
  #generates news feed model
  rails g model Story title:string body:text user:references
  
#################################
#### End Scaffold Generation ####
#################################

#################################
#### Update Main Routes #########
#################################
  #Updates our routes file
  sed -i '10i\root "welcome#index"' config/routes.rb
#################################
#### End Update Routes ##########
#################################

#################################
#### Update Main View Files #####
#################################
  #All rails views are embedded in the same application view. If you want
  # to add something (such as devise messages) to all views in a rails
  # application, you can add it to the application view
  #sed -i '10i\<p class="notice"><%= notice %></p>' app/views/layouts/application.html.erb
  #sed -i '11i\<p class="alert"><%= alert %></p>' app/views/layouts/application.html.erb
  sed -i '10i\<div id="user_nav">' app/views/layouts/application.html.erb
  sed -i '11i\<% if user_signed_in? %>' app/views/layouts/application.html.erb
  sed -i '12i\<nav class="navbar navbar-fixed-top navbar-inverse">' app/views/layouts/application.html.erb
  sed -i '13i\  <div class="container-fluid">' app/views/layouts/application.html.erb
  sed -i '14i\    <div class="navbar-header">' app/views/layouts/application.html.erb
  sed -i '15i\      <%= link_to "Synth JF1", "#{root_path}", class: "navbar-brand" %>' app/views/layouts/application.html.erb
  sed -i '16i\    </div>' app/views/layouts/application.html.erb
  sed -i '17i\    <div>' app/views/layouts/application.html.erb
  sed -i '18i\      <ul class="nav navbar-nav">' app/views/layouts/application.html.erb
  sed -i '19i\        <li><%= link_to "Home", "#{root_path}" %></li>' app/views/layouts/application.html.erb
  sed -i '20i\      </ul>' app/views/layouts/application.html.erb
  sed -i '21i\    </div>' app/views/layouts/application.html.erb
  sed -i '22i\    <div>' app/views/layouts/application.html.erb
  sed -i '23i\      <ul class="nav navbar-nav navbar-right">' app/views/layouts/application.html.erb
  sed -i '24i\        <li><%= link_to "Sign out", destroy_user_session_path, method: :delete %></li>' app/views/layouts/application.html.erb
  sed -i '25i\      </ul>  ' app/views/layouts/application.html.erb
  sed -i '26i\    </div>' app/views/layouts/application.html.erb
  sed -i '27i\  </div>' app/views/layouts/application.html.erb
  sed -i '28i\</nav>' app/views/layouts/application.html.erb
  sed -i '29i\<% else %>' app/views/layouts/application.html.erb
  sed -i '30i\<nav class="navbar navbar-fixed-top navbar-inverse">' app/views/layouts/application.html.erb
  sed -i '31i\  <div class="container-fluid">' app/views/layouts/application.html.erb
  sed -i '32i\    <div class="navbar-header">' app/views/layouts/application.html.erb
  sed -i '33i\      <%= link_to "Synth JF1", "#{root_path}", class: "navbar-brand" %>' app/views/layouts/application.html.erb
  sed -i '34i\    </div>' app/views/layouts/application.html.erb
  sed -i '35i\    <div>' app/views/layouts/application.html.erb
  sed -i '36i\      <ul class="nav navbar-nav">' app/views/layouts/application.html.erb
  sed -i '37i\        <li><%= link_to "Home", "#{root_path}" %></li>' app/views/layouts/application.html.erb
  sed -i '38i\      </ul>' app/views/layouts/application.html.erb
  sed -i '39i\    </div>' app/views/layouts/application.html.erb
  sed -i '40i\    <div>' app/views/layouts/application.html.erb
  sed -i '41i\      <ul class="nav navbar-nav navbar-right">' app/views/layouts/application.html.erb
  sed -i '42i\        <li><%= link_to "Sign up", new_user_registration_path %></li>' app/views/layouts/application.html.erb
  sed -i '43i\        <li><%= link_to "Sign in", new_user_session_path %>' app/views/layouts/application.html.erb
  sed -i '44i\      </ul>  ' app/views/layouts/application.html.erb
  sed -i '45i\    </div>' app/views/layouts/application.html.erb
  sed -i '46i\   </div>' app/views/layouts/application.html.erb
  sed -i '47i\</nav>' app/views/layouts/application.html.erb
  sed -i '48i\<% end %>' app/views/layouts/application.html.erb
  sed -i '49i\</div>' app/views/layouts/application.html.erb
  sed -i '50i\<br>' app/views/layouts/application.html.erb
  sed -i '51i\<br>' app/views/layouts/application.html.erb
  sed -i '52i\<br>' app/views/layouts/application.html.erb
  
  #adds bootstrap header content
  sed -i '8i\<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">' app/views/layouts/application.html.erb
  sed -i '9i\<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>' app/views/layouts/application.html.erb
  sed -i '10i\<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>' app/views/layouts/application.html.erb
#################################
#### End Main View Update #######
#################################

#################################
#### Change Devise File #########
#################################
  #changes password required length to 1 for testing purposes
  sed -i '145s/.*/  config.password_length = 1..128/' config/initializers/devise.rb
  
  # Devise Confirmation add div container
  sed -i '1i\<div class="container">' app/views/devise/confirmations/new.html.erb
  sed -i "\$a</div>" app/views/devise/confirmations/new.html.erb
  
  # Devise Mailer add div container
  sed -i '1i\<div class="container">' app/views/devise/mailer/unlock_instructions.html.erb
  sed -i "\$a</div>" app/views/devise/mailer/unlock_instructions.html.erb
  sed -i '1i\<div class="container">' app/views/devise/mailer/reset_password_instructions.html.erb
  sed -i "\$a</div>" app/views/devise/mailer/reset_password_instructions.html.erb
  sed -i '1i\<div class="container">' app/views/devise/mailer/confirmation_instructions.html.erb
  sed -i "\$a</div>" app/views/devise/mailer/confirmation_instructions.html.erb
  
  # Devise Passwords add div container
  sed -i '1i\<div class="container">' app/views/devise/passwords/new.html.erb
  sed -i "\$a</div>" app/views/devise/passwords/new.html.erb
  sed -i '1i\<div class="container">' app/views/devise/passwords/edit.html.erb
  sed -i "\$a</div>" app/views/devise/passwords/edit.html.erb
  
  # Devise Registrations add div container
  sed -i '1i\<div class="container">' app/views/devise/registrations/new.html.erb
  sed -i "\$a</div>" app/views/devise/registrations/new.html.erb
  sed -i '1i\<div class="container">' app/views/devise/registrations/edit.html.erb
  sed -i "\$a</div>" app/views/devise/registrations/edit.html.erb
  
  # Devise sessions add div container
  sed -i '1i\<div class="container">' app/views/devise/sessions/new.html.erb
  sed -i "\$a</div>" app/views/devise/sessions/new.html.erb
  
  # Devise sessions add div container
  sed -i '1i\<div class="container">' app/views/devise/unlocks/new.html.erb
  sed -i "\$a</div>" app/views/devise/unlocks/new.html.erb
#################################
#### End Devise File Updates ####
#################################

#################################
#### Add Container Divs #########
#################################
  # Synth Index add div container
  sed -i '1i\<div class="container">' app/views/synth/index.html.erb
  sed -i "\$a</div>" app/views/synth/index.html.erb
  
  # Sequencer Index add div container
  sed -i '1i\<div class="container">' app/views/sequencer/index.html.erb
  sed -i "\$a</div>" app/views/sequencer/index.html.erb
  
  # Welcome Index add div container
  sed -i '1i\<div class="container">' app/views/welcome/index.html.erb
  sed -i "\$a</div>" app/views/welcome/index.html.erb
#################################
#### End Add Container Divs #####
#################################

RAILS_ENV=production rake db:migrate
rake db:migrate
rake routes
sudo apache2ctl restart
