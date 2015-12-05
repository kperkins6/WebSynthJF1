# This program will generate the basics of a synthesizer and sequencer website.
# The website will have users that have a private and public list of sequencer 
# or synth presets. They can share presets with the public (will be displayed on 
# the synth or sequencer's show page
# Due to making mistakes all the time, If fatal errors occur, this makes it easy
# restart without pulling out too many hairs
rails new webSynth
cd webSynth

#Add gems to Gemfile
echo "################################" >> /webSynth/Gemfile
echo "## Custom Gems Below ###########" >> /webSynth/Gemfile
echo "################################" >> /webSynth/Gemfile
echo "gem 'devise'" >> /webSynth/Gemfile
echo "gem 'quiet_assets', group: :development" >> /webSynth/Gemfile
echo "gem 'better_errors', group: :development" >> /webSynth/Gemfile
echo "gem 'binding_of_caller', group: :development" >> /webSynth/Gemfile
echo "################################" >> /webSynth/Gemfile
echo "## Custom Gems End #############" >> /webSynth/Gemfile
echo "################################" >> /webSynth/Gemfile

RAILS_ENV=production rake db:migrate

#Generate scaffolds for Image, Tag, and ImageUser
rails g scaffold SynthPreset filename:string private:boolean user_id:integer
rails g scaffold SequencerPreset filename:string private:boolean user_id:integer
rails g scaffold SynthTag str:string synth_id:integer
rails g scaffold SynthTag str:string sequencer_id:integer
rails g scaffold SynthPresetUser preset_id:integer user_id:integer
rails g scaffold SequencerPresetUser preset_id:integer user_id:integer

#Install all gems
bundle install

#generate views for devise user
rails generate devise:install
rails generate devise user
rake db:migrate
