function try_run(){
  ruby main.rb
}

function config_and_run(){
  gem install bundle
  bundle install
  ruby main.rb
}

try_run || config_and_run