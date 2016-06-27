require 'sinatra'
require 'sinatra/reloader'

SECRET = rand(100)

get '/' do
  guess = params["guess"]
  message = check_guess(guess.to_i) if !guess.nil?
  erb :index, :locals => {:number => SECRET, :message => message}
end

def check_guess(num)
  return "Way too high!" if num > SECRET + 5
  return "Too high!" if num > SECRET
  return "Way too low!" if num < SECRET - 5
  return "Too low!" if num < SECRET
  return "You got it! The secret number is #{SECRET}!" if num == SECRET
end
