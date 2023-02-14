require 'rspec'
require 'dotenv'
require 'pry'
Dotenv.load

Dir["./lib/*.rb"].each { |file| require file }
