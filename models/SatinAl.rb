class SatinAl
  attr_accessor :id, :satin_alma_tarihi, :odenen_tutar
  def initialize(id, satin_alma_tarihi, odenen_tutar)
    @id = id
    @satin_alma_tarihi = satin_alma_tarihi
    @odenen_tutar = odenen_tutar
  end
  def self.aldiklari(k_id)
    sorgu = baglanti.prepare("SELECT * FROM Satin_almalar, Filmler, Kullanicilar WHERE Satin_almalar.Kullanicilar_id = Kullanicilar.idKullanicilar and Satin_almalar.Filmler_id = Filmler.idFilmler and Kullanicilar.idKullanicilar = ?")
    sonuc = sorgu.execute(k_id)
  end
  def self.olustur(k_id,film_id,tarih,fiyat)
    sorgu = baglanti.prepare("INSERT INTO `Satin_almalar` VALUES (NULL, ?, ?, ?, ?)")
    sonuc = sorgu.execute(k_id, film_id, tarih, fiyat)
    puts "#{k_id} idli kullanici #{film_id} idli filmi #{fiyat} ₺'ye satın aldı."
  end
  def self.tumu
    sorgu = baglanti.query("SELECT * FROM Satin_almalar, Filmler, Kullanicilar WHERE Satin_almalar.Kullanicilar_id = Kullanicilar.idKullanicilar and Satin_almalar.Filmler_id = Filmler.idFilmler order by satin_alma_tarihi")
  end
  def guncelle(kullanici_adi, ad, soyad, parola)

  end
end
