post '/satin_alma/' do
  kullanici_giris
  film_id = params['film_id']
  @film = Film.getir(film_id)
  tarih = "#{Time.now.year}-#{Time.now.mon}-#{Time.now.day}"
  SatinAl.olustur(@kullanici.id,film_id,tarih,3)
  erb :'Filmler/fatura'
end

def kullanici_giris
  if session[:user_id]
    @kullanici = Kullanici.id_ile_ara(session['user_id'].inspect)
  end
end
