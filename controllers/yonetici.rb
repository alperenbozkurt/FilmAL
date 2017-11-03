# ADMIN ILE ILGILI YONLENDIRMELER
get "/yonetici/" do
  if session[:user_id].nil?
    flash[:sonuc] = "Yetkisiz Erişim Engellendi."
    redirect "/kullanicilar/giris/"
  else
    kullanici = Kullanici.id_ile_ara(session[:user_id])
    puts kullanici.admin_mi, "--------------"
    if kullanici.admin_mi == 1
      erb :'admin/index'
    else
      flash[:sonuc] = "Yetkisiz Erişim Engellendi."
      redirect "/kullanicilar/giris/"
    end

  end
end


get "/admin/yonetmenler/ekle/" do

end

get "/admin/yonetmenler/listele/" do

end

get "/admin/yonetmenler/:id/sil/" do

end
