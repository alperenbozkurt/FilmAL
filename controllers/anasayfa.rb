# ANASAYFA ILE ILGILI YONLENDIRMELER
get '/' do
  if session[:user_id]
    @kullanici = Kullanici.id_ile_ara(session['user_id'].inspect)
  end
  @filmler = Film.tumu
  erb :'index'
end
