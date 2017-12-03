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
    sorgu = baglanti.prepare("SELECT Filmler.*, Yonetmenler.adi as yonetmen_adi FROM Filmler, Yonetmenler WHERE Filmler.Yonetmen_id = Yonetmenler.idYonetmenler and Filmler.film_adi like ?")
    sonuc = sorgu.execute(adi)
    puts "Arama Yapıldı. #{sonuc.size} eleman bulundu."
    sonuc
  end
  def self.getir(film_id)
    sorgu = baglanti.prepare("SELECT Filmler.*, Yonetmenler.adi as yonetmen_adi FROM Filmler, Yonetmenler WHERE Filmler.Yonetmen_id = Yonetmenler.idYonetmenler and Filmler.idFilmler = ?")
    sonuc = sorgu.execute(film_id)
    sonuc = sonuc.first
  end
  def self.tumu
    sonuc = baglanti.query("SELECT Filmler.*, Yonetmenler.adi as yonetmen_adi FROM Filmler, Yonetmenler WHERE Filmler.Yonetmen_id = Yonetmenler.idYonetmenler")
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
