require 'sinatra'
require 'sinatra/reloader'

@@number = rand(101)

get '/' do
  guess = params['guess'].to_i
  if guess > @@number + 5
    @@response = "Way Too High"
    @@color = "crimson"
  elsif guess > @@number
    @@response = "Too High"
    @@color = "coral"
  elsif guess < @@number - 5
    @@response = "Way Too Low"
    @@color = "crimson"
  elsif guess < @@number
    @@response = "Too Low"
    @@color = "coral"
  elsif guess == @@number
    @@response = "You got it right! The secret number is #{@@number}"
    @@color = "aquamarine"
  end
  erb :index, :locals => {:number => @@number, :response => @@response}
end
