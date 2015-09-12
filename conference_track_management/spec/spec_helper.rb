Dir["#{File.expand_path('../../app/*/', __FILE__)}/*.rb"].each {|file| require file }
require 'byebug'