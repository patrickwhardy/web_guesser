require 'sinatra'
require 'sinatra/reloader'

@@number = rand(101)

get '/' do
  guess = params['guess'].to_i
  if guess > @@number + 5
    @@response = "Way Too High"
  elsif guess > @@number
    @@response = "Too High"
  elsif guess < @@number - 5
    @@response = "Way Too Low"
  elsif guess < @@number
    @@response = "Too Low"
  elsif guess == @@number
    @@response = "You got it right! The secret number is #{@@number}"
  end
  erb :index, :locals => {:number => @@number, :response => @@response}
end
