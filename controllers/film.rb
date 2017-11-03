get "/filmler/ara/:film_adi/" do
  @filmler = Film.ara(params['film_adi'])
  erb :'Filmler/ara'
end

post "/filmler/ara/" do
  film_adi = params['film_adi']
  puts "xxxx"
  redirect "/filmler/ara/#{film_adi}/"
end
