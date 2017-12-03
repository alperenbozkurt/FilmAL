get "/filmler/ara/:film_adi/" do
  @filmler = Film.ara(params['film_adi'])
  erb :'Filmler/ara'
end

post "/filmler/ara/" do
  film_adi = params['film_adi']
  puts "xxxx"
  redirect "/filmler/ara/#{film_adi}/"
end

get '/film/:id' do
  film_id = params['id']
  puts "Film idsi #{film_id} olan film aranıyor...."
  @film = Film.getir(film_id)
  puts @film["film_adi"] + " adli film bulundu."
  erb :'Filmler/goster'
end
