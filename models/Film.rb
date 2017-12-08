class Film
  attr_accessor :id,:film_adi,:aciklama,:idmb_puanı,:poster_url,:video_url,:yapim_tarihi,:yonetmen_adi,:yonetmen_id
  def initialize(id = 0,film_adi = "",aciklama="",imdb_puani="",poster_url="",video_url="",yapim_tarihi="",yonetmen_id="",yonetmen_adi="")
    @id = id
    @film_adi = film_adi
    @aciklama = aciklama
    @imdb_puani = imdb_puani
    @poster_url = poster_url
    @fragman_url = fragman_url
    @video_url = video_url
    @yapim_tarihi = yapim_tarihi
    @yonetmen_adi = yonetmen_adi
    @yonetmen_id = yonetmen_id
  end
  def self.ara(adi)
    adi = "%"+adi+"%"
    sorgu = baglanti.prepare("SELECT Filmler.* FROM Filmler, Yonetmenler WHERE Filmler.Yonetmen_id = Yonetmenler.idYonetmenler and Filmler.film_adi like ?")
    sonuc = sorgu.execute(adi)
    puts "Arama Yapıldı. #{sonuc.size} eleman bulundu."
    sonuc
  end
  def self.getir(film_id)
    sorgu = baglanti.prepare("SELECT DISTINCT * FROM Filmler, Oyuncular, Oyuncular_has_Filmler,Yonetmenler WHERE Filmler.idFilmler = Oyuncular_has_Filmler.Film_idFilmler and Oyuncular_has_Filmler.Oyuncular_idOyuncular = Oyuncular.idOyuncular and Yonetmenler.idYonetmenler = Filmler.Yonetmen_id and Filmler.idFilmler = ?")
    sonuc = sorgu.execute(film_id)
  end
  def self.rastgele
    sorgu = baglanti.query("SELECT * FROM Filmler ORDER BY RAND() LIMIT 6")
  end
  def self.tumu
    sonuc = baglanti.query("SELECT * FROM Filmler")
    puts "Arama Yapıldı. #{sonuc.size} film bulundu."
    sonuc
  end
  def self.filmeoyuncuekle(oyuncu_id,film_id)
    sorgu = baglanti.prepare("INSERT INTO `Oyuncular_has_Filmler` VALUES (NULL, ?, ?)")
    sonuc = sorgu.execute(oyuncu_id,film_id)
    puts "Oyuncu Filme eklendi"
    sonuc
  end
  def self.varmi?(k_id, film_id)
    sorgu = baglanti.prepare("SELECT * FROM Satin_almalar, Filmler, Kullanicilar WHERE Satin_almalar.Kullanicilar_id = Kullanicilar.idKullanicilar and Satin_almalar.Filmler_id = Filmler.idFilmler and Filmler.idFilmler = ? and Kullanicilar.idKullanicilar = ?")
    sonuc = sorgu.execute(film_id,k_id)
    puts sonuc.first.nil?
    if sonuc.first.nil?
      return false
    else
      return true
    end
  end
  def self.Ekle(film_adi,film_aciklama,film_imdb_puani,film_poster_url,film_fragman_url,film_video_url,yapim_tarihi,film_fiyat,yonetmen_id)
    sorgu = baglanti.prepare("INSERT INTO `Filmler` VALUES (NULL, ?, ?, ?, ?, ?, ?, ?, ?, ?)")
    sonuc = sorgu.execute(film_adi,film_aciklama,film_imdb_puani,film_poster_url,film_fragman_url,film_video_url,yapim_tarihi,film_fiyat,yonetmen_id)
    puts "Film Eklendi"
  end
  def guncelle(kullanici_adi, ad, soyad, parola)

  end
end
