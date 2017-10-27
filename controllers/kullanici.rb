get "/kullanicilar/giris/" do

  erb :'kullanicilar/giris'
end

post "/kullanicilar/giris/" do
  kadi = params["kullanici_adi"]
  parola = params["parola"]

  sonuc = Kullanici.giris(kadi,parola)

  if sonuc.count == 0
    flash[:sonuc] = "Kullanıcı Adınız Veya Parolanız Hatalı."
    redirect "/kullanicilar/giris/"
  else
    sonuc.each do |e|
      if e['admin_mi'] == 1
        flash[:sonuc] = "Başarıyla giriş yaptınız."
        redirect "/admin/"
      else
        kullanici = Kullanici.new(e['idKullanicilar'],e['kullanici_adi'],e['adi'],e['soyadi'],e['resim_url'],e['admin_mi'])
        puts kullanici, kullanici.id, "---------------"
        session[:user_id] = kullanici.id
        flash[:sonuc] = "Başarıyla giriş yaptınız."
        redirect "/"
      end
    end
  end
end
