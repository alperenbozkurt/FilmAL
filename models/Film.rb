class Film
  attr_accessor :id,:film_adi,:aciklama,:idmb_puanı,:poster_url,:video_url,:yapim_tarihi,:yonetmen_adi,:yonetmen_id
  def initialize(id = 0,film_adi = "",aciklama="",imdb_puani="",poster_url="",video_url="",yapim_tarihi="",yonetmen_id="",yonetmen_adi="")
    @id = id
    @film_adi = film_adi
    @aciklama = aciklama
    @imdb_puani = imdb_puani
    @poster_url = poster_url
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
  def olustur()

  end
  def sil()

  end
  def guncelle(kullanici_adi, ad, soyad, parola)

  end
end
