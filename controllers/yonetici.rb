# ADMIN ILE ILGILI YONLENDIRMELER
get "/yonetici/" do
  kontrol?
  kullanici_giris

  erb :'admin/index'
end
get "/yonetici/satin_almalar/" do
  kontrol?
  kullanici_giris
  @satin_almalar = SatinAl.tumu
  erb :'admin/satin_almalar'
end

get "/yonetici/kullanicilar/" do
  kontrol?
  kullanici_giris
  @kullanicilar = Kullanici.tumu
  erb :'admin/kullanicilar'
end


get "/yonetici/yonetmenler/" do
  kontrol?
  kullanici_giris
  @yonetmenler = Yonetmen.tumu
  erb :'admin/yonetmen'
end

get "/yonetici/yonetmenler/ekle/" do
  kontrol?
  kullanici_giris
  erb :'admin/yonetmenekle'
end

post "/yonetici/yonetmenler/ekle/" do
  kontrol?
  kullanici_giris
  yonetmen_adi = params['yonetmen_adi']
  yonetmen_dogum_tarihi = params['yonetmen_dogum_tarihi']
  yonetmen_aciklama = params['yonetmen_aciklama']
  yonetmen_resim_url = params['yonetmen_resim_url']
  Yonetmen.Ekle(yonetmen_adi,yonetmen_dogum_tarihi,yonetmen_aciklama,yonetmen_resim_url)
  erb :'admin/yonetmenekle'
end

get "/yonetici/oyuncular/" do
  kontrol?
  kullanici_giris
  @yonetmenler = Oyuncu.tumu
  erb :'admin/oyuncular'
end

get "/yonetici/filmler/" do
  kontrol?
  kullanici_giris
  @filmler = Film.tumu
  erb :'admin/filmler'
end

get "/yonetici/oyuncular/ekle/" do
  kontrol?
  kullanici_giris
  erb :'admin/oyuncuekle'
end

post "/yonetici/oyuncular/ekle/" do
  kontrol?
  kullanici_giris
  oyuncu_adi = params['oyuncu_adi'],
  oyuncu_soyadi = params['oyuncu_soyadi']
  oyuncu_dogum_tarihi = params['oyuncu_dogum_tarihi']
  oyuncu_aciklama = params['oyuncu_aciklama']
  oyuncu_resim_url = params['oyuncu_resim_url']
  Oyuncu.Ekle(oyuncu_adi,oyuncu_soyadi,oyuncu_dogum_tarihi,oyuncu_aciklama,oyuncu_resim_url)
  erb :'admin/oyuncuekle'
end

get "/yonetici/filmler/ekle/" do
  kontrol?
  kullanici_giris
  @yonetmenler = Yonetmen.tumu
  erb :'admin/filmekle'
end

post "/yonetici/filmler/ekle/" do
  kontrol?
  kullanici_giris
  @yonetmenler = Yonetmen.tumu
  film_adi = params['film_adi']
  film_aciklama = params['aciklama']
  film_imdb_puani = params['imdb_puani']
  film_poster_url = params['poster_url']
  film_fragman_url = params['fragman_url']
  film_video_url = params['video_url']
  film_yapim_tarihi = params['yapim_tarihi']
  film_fiyat = params['fiyat']
  yonetmen_id = params['yonetmen_id']
  Film.Ekle(film_adi,film_aciklama,film_imdb_puani,film_poster_url,film_fragman_url,film_video_url,film_yapim_tarihi,film_fiyat,yonetmen_id)
  erb :'admin/filmekle'
end

get "/yonetici/filmler/oyuncuekle/" do
  kontrol?
  kullanici_giris
  @oyuncular = Oyuncu.tumu
  @filmler = Film.tumu
  erb :'admin/filmeoyuncuekle'
end
post "/yonetici/filmler/oyuncuekle/" do
  kontrol?
  kullanici_giris
  oyuncu_id = params['oyuncu_id']
  film_id = params['film_id']
  Film.filmeoyuncuekle(oyuncu_id,film_id)
  erb :'admin/filmeoyuncuekle'
end
private

def kontrol?
  if session[:user_id].nil?
    flash[:sonuc] = "Yetkisiz Erişim Engellendi."
    redirect "/kullanicilar/giris/"
  else
    kullanici = Kullanici.id_ile_ara(session[:user_id])
    if kullanici.admin_mi == 0
      flash[:sonuc] = "Yetkisiz Erişim Engellendi."
      redirect "/kullanicilar/giris/"
    end
  end
end

def kullanici_giris
  if session[:user_id]
    @kullanici = Kullanici.id_ile_ara(session['user_id'].inspect)
  end
end
