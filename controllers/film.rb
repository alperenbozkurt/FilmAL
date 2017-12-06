get "/filmler/ara/:film_adi/" do
  kullanici_giris?
  @filmler = Film.ara(params['film_adi'])
  erb :'Filmler/ara'
end
get '/filmler/ara/' do
  kullanici_giris?
  @filmler = Film.tumu
  params['film_adi'] = "( NIL )"
  erb :'Filmler/ara'
end
post "/filmler/ara/" do
  kullanici_giris?
  film_adi = params['film_adi']
  puts "Film bulundu yönlendiriliyor."
  redirect "/filmler/ara/#{film_adi}/"
end
get '/film/:id' do
  kullanici_giris?
  film_id = params['id']
  puts "Film idsi #{film_id} olan film aranıyor...."
  @film = Film.getir(film_id)
  puts @film.first["film_adi"] + " adli film bulundu."
  @oneriler = Film.rastgele
  puts "Algoritma bu kullanıcı için 6 adet film buldu"
  erb :'Filmler/goster'
end

private

def kullanici_giris?
  if session[:user_id]
    @kullanici = Kullanici.id_ile_ara(session['user_id'].inspect)
  end
end
