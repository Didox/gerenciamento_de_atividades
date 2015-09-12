function config_and_run(){
  gem install bundle
  bundle install
  rspec spec
}

config_and_run