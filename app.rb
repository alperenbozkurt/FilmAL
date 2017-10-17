require "sinatra"
require "mysql2"

get '/' do
  @isim = "Hello"
  erb :index
end


get '/kurulum/' do
  erb :kurulum
end

post '/kurulum/kur/' do
  client = Mysql2::Client.new(:host => "localhost", :username => "root", :password => "comolokko37", :database => "Filmx")
  client.query("CREATE TABLE `Filmler` (
  	`id` int PRIMARY KEY,
  	`adi` varchar(255),
  	`imdb_puani` int,
  	`aciklamasi` varchar(255),
  	`tarihi` datetime,
  	`linki` varchar(255),
  	`turu` varchar(255),
  	`poster` varchar(255)
  );")
  erb :sonuclar
end
