#!/usr/bin/bash
# This program will generate the basics of a synthesizer and sequencer website.
# The website will have users that have a private and public list of sequencer
# or synth presets. They can share presets with the public (will be displayed on
# the synth or sequencer's show page
# Due to making mistakes all the time, If fatal errors occur, this makes it easy
# restart without pulling out too many hairs
rails new webSynth
cd webSynth

#Add gems to Gemfile
echo "################################" >> Gemfile
echo "## Custom Gems Below ###########" >> Gemfile
echo "################################" >> Gemfile
echo "gem 'devise'" >> Gemfile
echo "gem 'quiet_assets', group: :development" >> Gemfile
echo "gem 'better_errors', group: :development" >> Gemfile
echo "gem 'binding_of_caller', group: :development" >> Gemfile
echo "gem 'ember-rails'" >> Gemfile
echo "gem 'ember-source', '~> 1.9.0'" >> Gemfile
echo "################################" >> Gemfile
echo "## Custom Gems End #############" >> Gemfile
echo "################################" >> Gemfile

#Generate scaffolds for Image, Tag, and ImageUser
rails g scaffold SynthPreset filename:string private:boolean user_id:integer
rails g scaffold SequencerPreset filename:string private:boolean user_id:integer
rails g scaffold SynthTag str:string synth_id:integer
rails g scaffold SequencerTag str:string sequencer_id:integer
rails g scaffold SynthPresetUser preset_id:integer user_id:integer
rails g scaffold SequencerPresetUser preset_id:integer user_id:integer
rails g controller Welcome index

#Updates our routes file
sed -i '10i\root "welcome#index"' config/routes.rb

#Install all gems
bundle install

#generate ember bootstrap
rails generate ember:bootstrap

#generate views for devise user
rails generate devise:install
rails generate devise user name:string
rails generate devise:views

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
sed -i '15i\      <%= link_to "#{current_user.name}", "#{root_path}", class: "navbar-brand" %>' app/views/layouts/application.html.erb
sed -i '16i\    </div>' app/views/layouts/application.html.erb
sed -i '17i\    <div>' app/views/layouts/application.html.erb
sed -i '18i\      <ul class="nav navbar-nav">' app/views/layouts/application.html.erb
sed -i '19i\        <li><%= link_to "Home", "#{root_path}" %></li>' app/views/layouts/application.html.erb
sed -i '20i\      </ul>' app/views/layouts/application.html.erb
sed -i '21i\    </div>' app/views/layouts/application.html.erb
sed -i '22i\    <div>' app/views/layouts/application.html.erb
sed -i '24i\        <li><%= link_to "Sign out", destroy_user_session_path, method: :delete %></li>' app/views/layouts/application.html.erb
sed -i '25i\      </ul>  ' app/views/layouts/application.html.erb
sed -i '26i\    </div>' app/views/layouts/application.html.erb
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


#changes password required length to 1 for testing purposes
sed -i '145s/.*/  config.password_length = 1..128/' config/initializers/devise.rb

RAILS_ENV=production rake db:migrate
rake db:migrate
rake routes
sudo apache2ctl restart
