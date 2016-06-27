require 'sinatra'
require 'sinatra/reloader'

get '/' do
  num = rand(100)
  "The SECRET NUMBER is #{num}."
end
