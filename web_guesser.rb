require 'sinatra'
require 'sinatra/reloader'

SECRET = rand(100)

def check_guess(num)
  return "Way too high!" if num > SECRET+5
  return "Too high!" if num > SECRET
  return "Way too low!" if num < SECRET-5
  return "Too low!" if num < SECRET
  return "You got it! The secret number is #{SECRET}!" if num == SECRET
end

def get_bg_color(num)
  return "Red" if num > SECRET+5 || num < SECRET-5
  return "LightPink" if num > SECRET || num < SECRET
  return "Green" if num == SECRET
end

get '/' do
  guess = params["guess"]
  message = check_guess(guess.to_i) if !guess.nil?
  bgcolor = get_bg_color(guess.to_i) if !guess.nil?
  cheater = params['cheater']
  if cheater == "true"
    cheat_msg = "The secret number is #{SECRET}, you cheater."
  end
  erb :index, :locals => {:number => SECRET, :message => message, :bgcolor => bgcolor, :cheat_msg => cheat_msg}
  #throw params.inspect
end
